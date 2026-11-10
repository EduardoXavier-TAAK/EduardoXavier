@isTest
public with sharing class ServiceTest {
    private static final String CLIENT_NAME = 'Cliente';
    private static final String ADDRESS_NAME = 'Endereco';
    private static final String PRODUCT_NAME = 'Produto';
    private static final String GROUP_NAME = 'Grupo';
    private static final String HIERARCHY_NAME = 'Hierarquia';
    private static final String CENTER_NAME = 'Centro';

    @TestSetup
    static void createTestData() {
        Account_Group__c clientGroup = new Account_Group__c(Name = GROUP_NAME);
        Product_Hierarchy__c hierarchy = new Product_Hierarchy__c(
            Name = HIERARCHY_NAME,
            Code__c = 101
        );
        Distribution_Center__c center = new Distribution_Center__c(
            Name = CENTER_NAME,
            Code__c = 102
        );
        Payment_Condition__c payment = new Payment_Condition__c(
            Name = 'Payment',
            Code__c = 103
        );
        Country__c country = new Country__c(
            Name = 'Pais',
            FU__c = 'CC'
        );
        insert new List<SObject>{ clientGroup, hierarchy, center, payment, country };

        State__c state = new State__c(
            Name = 'Estado',
            Country__c = country.Id,
            FU__c = 'CS'
        );
        insert state;
        City__c city = new City__c(
            Name = 'Cidade',
            State__c = state.Id,
            IBGE_Code__c = 1234567
        );
        insert city;

        Account client = new Account(
            Name = CLIENT_NAME,
            CNPJ__c = '12345678901239',
            Client_Group__c = clientGroup.Id
        );
        insert client;

        Account_Address__c address = new Account_Address__c(
            Name = ADDRESS_NAME,
            Account__c = client.Id,
            City__c = city.Id,
            Public_Space__c = 'Street',
            Postal_Code__c = '00000-000',
            District__c = 'District',
            Code__c = 104
        );
        insert address;

        Product2 product = new Product2(
            Name = PRODUCT_NAME,
            Product_Hierarchy__c = hierarchy.Id,
            IsActive = true
        );
        insert product;

        insert new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = product.Id,
            UnitPrice = 100,
            IsActive = true
        );
    }

    private static Account getClient() {
        return [
            SELECT Id, Client_Group__c
            FROM Account
            WHERE Name = :CLIENT_NAME
            LIMIT 1
        ];
    }

    private static Account_Address__c getAddress() {
        return [
            SELECT Id, City__c, Account__c
            FROM Account_Address__c
            WHERE Name = :ADDRESS_NAME
            LIMIT 1
        ];
    }

    private static Product2 getProduct() {
        return [
            SELECT Id, Product_Hierarchy__c
            FROM Product2
            WHERE Name = :PRODUCT_NAME
            LIMIT 1
        ];
    }

    private static Distribution_Center__c getCenter() {
        return [
            SELECT Id
            FROM Distribution_Center__c
            WHERE Name = :CENTER_NAME
            LIMIT 1
        ];
    }

    private static Order createOrder(Account_Address__c address) {
        Account client = getClient();
        Payment_Condition__c payment = [
            SELECT Id
            FROM Payment_Condition__c
            WHERE Name = 'Payment'
            LIMIT 1
        ];

        Order orderRecord = new Order(
            Customer__c = client.Id,
            AccountId = client.Id,
            Account_Address__c = address.Id,
            Payment_Condition__c = payment.Id,
            Pricebook2Id = Test.getStandardPricebookId(),
            Shipping_Type__c = 'FOB',
            Delivery_Date__c = Date.newInstance(2026, 11, 22),
            EffectiveDate = Date.newInstance(2026, 11, 20),
            Status = 'Draft'
        );
        insert orderRecord;
        return orderRecord;
    }

    private static OrderItem createOrderItem(Order orderRecord) {
        Product2 product = getProduct();
        PricebookEntry entry = [
            SELECT Id
            FROM PricebookEntry
            WHERE Product2Id = :product.Id
              AND Pricebook2Id = :Test.getStandardPricebookId()
            LIMIT 1
        ];
        return new OrderItem(
            OrderId = orderRecord.Id,
            PricebookEntryId = entry.Id,
            Product2Id = product.Id,
            UnitPrice = 100,
            ListPrice = 100,
            Quantity = 2,
            Shipping_Cost__c = 0,
            Tax_Percentage__c = 0,
            Margin_Percentage__c = 0
        );
    }

    private static Shipping_Fee__c shippingFee(
        String name,
        Id productId,
        Id hierarchyId,
        Id cityId,
        Id stateId,
        Id countryId,
        Decimal value
    ) {
        return new Shipping_Fee__c(
            Name = name,
            Product__c = productId,
            Product_Hierarchy__c = hierarchyId,
            City__c = cityId,
            State__c = stateId,
            Country__c = countryId,
            Distribution_Center__c = getCenter().Id,
            Value__c = value,
            Status__c = 'Approved'
        );
    }

    private static Margin__c margin(
        String name,
        Id productId,
        Id hierarchyId,
        Id clientId,
        Id groupId,
        Id cityId,
        Id stateId,
        Id countryId,
        Decimal value
    ) {
        return new Margin__c(
            Name = name,
            Product__c = productId,
            Product_Hierarchy__c = hierarchyId,
            Account__c = clientId,
            Account_Group__c = groupId,
            City__c = cityId,
            State__c = stateId,
            Country__c = countryId,
            Distribution_Center__c = getCenter().Id,
            Value__c = value
        );
    }

    private static void createSelectionRates() {
        Account client = getClient();
        Product2 product = getProduct();
        Account_Address__c address = [
            SELECT City__c, City__r.State__c, City__r.State__r.Country__c
            FROM Account_Address__c
            WHERE Name = :ADDRESS_NAME
            LIMIT 1
        ];

        Id cityId = address.City__c;
        Id stateId = address.City__r.State__c;
        Id countryId = address.City__r.State__r.Country__c;
        Id hierarchyId = product.Product_Hierarchy__c;
        Id groupId = client.Client_Group__c;

        insert new List<Shipping_Fee__c>{
            shippingFee('Frete Produto Cidade', product.Id, null, cityId, null, null, 11),
            shippingFee('Frete Produto Cidade Empate', product.Id, null, cityId, null, null, 12),
            shippingFee('Frete Produto Estado', product.Id, null, null, stateId, null, 13),
            shippingFee('Frete Produto Pais', product.Id, null, null, null, countryId, 14),
            shippingFee('Frete Hierarchy Cidade', null, hierarchyId, cityId, null, null, 15),
            shippingFee('Frete Hierarchy Estado', null, hierarchyId, null, stateId, null, 16),
            shippingFee('Frete Hierarchy Pais', null, hierarchyId, null, null, countryId, 17)
        };

        insert new List<Margin__c>{
            margin('Margin Produto Cliente Cidade', product.Id, null, client.Id, null, cityId, null, null, 21),
            margin('Margin Produto Cliente Cidade Empate', product.Id, null, client.Id, null, cityId, null, null, 22),
            margin('Margin Produto Cliente Estado', product.Id, null, client.Id, null, null, stateId, null, 23),
            margin('Margin Produto Cliente Pais', product.Id, null, client.Id, null, null, null, countryId, 24),
            margin('Margin Produto Grupo Cidade', product.Id, null, null, groupId, cityId, null, null, 25),
            margin('Margin Produto Grupo Estado', product.Id, null, null, groupId, null, stateId, null, 26),
            margin('Margin Produto Grupo Pais', product.Id, null, null, groupId, null, null, countryId, 27),
            margin('Margin Hierarquia Cliente Cidade', null, hierarchyId, client.Id, null, cityId, null, null, 28),
            margin('Margin Hierarquia Cliente Estado', null, hierarchyId, client.Id, null, null, stateId, null, 29),
            margin('Margin Hierarquia Cliente Pais', null, hierarchyId, client.Id, null, null, null, countryId, 30),
            margin('Margin Hierarquia Grupo Cidade', null, hierarchyId, null, groupId, cityId, null, null, 31),
            margin('Margin Hierarquia Grupo Estado', null, hierarchyId, null, groupId, null, stateId, null, 32),
            margin('Margin Hierarquia Grupo Pais', null, hierarchyId, null, groupId, null, null, countryId, 33)
        };

        insert new List<Tax__c>{
            new Tax__c(
                Name = 'Tax Older',
                Product__c = product.Id,
                State__c = stateId,
                Distribution_Center__c = getCenter().Id,
                Value__c = 4,
                Status__c = 'Approved'
            ),
            new Tax__c(
                Name = 'Tax Newer',
                Product__c = product.Id,
                State__c = stateId,
                Distribution_Center__c = getCenter().Id,
                Value__c = 6,
                Status__c = 'Approved'
            )
        };

        Test.setCreatedDate(
            [SELECT Id FROM Shipping_Fee__c WHERE Name = 'Frete Produto Cidade' LIMIT 1].Id,
            DateTime.newInstance(2020, 1, 1, 0, 0, 0)
        );
        Test.setCreatedDate(
            [SELECT Id FROM Shipping_Fee__c WHERE Name = 'Frete Produto Cidade Empate' LIMIT 1].Id,
            DateTime.newInstance(2021, 1, 1, 0, 0, 0)
        );
        Test.setCreatedDate(
            [SELECT Id FROM Margin__c WHERE Name = 'Margin Produto Cliente Cidade' LIMIT 1].Id,
            DateTime.newInstance(2020, 1, 1, 0, 0, 0)
        );
        Test.setCreatedDate(
            [SELECT Id FROM Margin__c WHERE Name = 'Margin Produto Cliente Cidade Empate' LIMIT 1].Id,
            DateTime.newInstance(2021, 1, 1, 0, 0, 0)
        );
        Test.setCreatedDate(
            [SELECT Id FROM Tax__c WHERE Name = 'Tax Older' LIMIT 1].Id,
            DateTime.newInstance(2020, 1, 1, 0, 0, 0)
        );
        Test.setCreatedDate(
            [SELECT Id FROM Tax__c WHERE Name = 'Tax Newer' LIMIT 1].Id,
            DateTime.newInstance(2021, 1, 1, 0, 0, 0)
        );
    }

    @isTest
    static void selectShippingTest() {
        createSelectionRates();
        Account_Address__c address = getAddress();
        Order orderRecord = createOrder(address);

        Test.startTest();
        OrderItem orderItem = createOrderItem(orderRecord);
        insert orderItem;
        Test.stopTest();

        OrderItem savedItem = [
            SELECT Shipping_Cost__c, Fee_Name__c, Margin_Percentage__c, Margin_Name__c,
                   Tax_Percentage__c, Tax_Name__c, UnitPrice, Price_Without_Margin__c
            FROM OrderItem
            WHERE Id = :orderItem.Id
        ];
        Assert.areEqual(12, savedItem.Shipping_Cost__c);
        Assert.areEqual('Frete Produto Cidade Empate', savedItem.Fee_Name__c);
        Assert.areEqual(22, savedItem.Margin_Percentage__c);
        Assert.areEqual('Margin Produto Cliente Cidade Empate', savedItem.Margin_Name__c);
        Assert.areEqual(6, savedItem.Tax_Percentage__c);
        Assert.areEqual('Tax Newer', savedItem.Tax_Name__c);
        Assert.isTrue(savedItem.UnitPrice > 100);
        Assert.isTrue(savedItem.Price_Without_Margin__c > 100);

        Order fullOrder = [
            SELECT Id, Customer__c, Customer__r.Client_Group__c,
                   Account_Address__r.City__c,
                   Account_Address__r.City__r.State__c,
                   Account_Address__r.City__r.State__r.Country__c
            FROM Order
            WHERE Id = :orderRecord.Id
        ];
        Product2 product = getProduct();
        OrderItem helperItem = new OrderItem(OrderId = fullOrder.Id, Product2Id = product.Id);
        Map<Id, Order> orders = new Map<Id, Order>{ fullOrder.Id => fullOrder };
        Map<Id, Product2> products = new Map<Id, Product2>{ product.Id => product };
        Map<String, Shipping_Fee__c> feesByName = new Map<String, Shipping_Fee__c>();
        for (Shipping_Fee__c fee : [
            SELECT Id, Name, Product__c, Product_Hierarchy__c, City__c, State__c, Country__c,
                   Value__c, CreatedDate
            FROM Shipping_Fee__c
            WHERE Name LIKE 'Fee %'
        ]) {
            feesByName.put(fee.Name, fee);
        }

        ShipSelectLocation shippingSelector = new ShipSelectLocation();
        for (String feeName : feesByName.keySet()) {
            OrderItem candidate = helperItem.clone(false, true, false, false);
            shippingSelector.selectFeeByLocation(
                candidate,
                orders,
                products,
                new List<Shipping_Fee__c>{ feesByName.get(feeName) }
            );
            Assert.areEqual(feeName, candidate.Fee_Name__c);
        }

        OrderItem tieItem = helperItem.clone(false, true, false, false);
        shippingSelector.selectFeeByLocation(
            tieItem,
            orders,
            products,
            new List<Shipping_Fee__c>{
                feesByName.get('Frete Produto Cidade'),
                feesByName.get('Frete Produto Cidade Empate')
            }
        );
        Assert.areEqual('Frete Produto Cidade Empate', tieItem.Fee_Name__c);

        OrderItem guardedItem = helperItem.clone(false, true, false, false);
        shippingSelector.selectFeeByLocation(
            guardedItem,
            new Map<Id, Order>(),
            products,
            new List<Shipping_Fee__c>()
        );
        shippingSelector.selectFeeByLocation(
            guardedItem,
            orders,
            new Map<Id, Product2>(),
            new List<Shipping_Fee__c>()
        );
        shippingSelector.selectFeeByLocation(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => new Order(Id = fullOrder.Id) },
            products,
            new List<Shipping_Fee__c>()
        );

        Order noCityOrder = new Order(
            Id = fullOrder.Id,
            Account_Address__r = new Account_Address__c()
        );
        shippingSelector.selectFeeByLocation(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => noCityOrder },
            products,
            new List<Shipping_Fee__c>()
        );
        noCityOrder.Account_Address__r = new Account_Address__c(
            City__c = address.City__c
        );
        shippingSelector.selectFeeByLocation(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => noCityOrder },
            products,
            new List<Shipping_Fee__c>()
        );

        Order cityWithoutStateRelation = new Order(
            Id = fullOrder.Id,
            Account_Address__r = new Account_Address__c(
                City__c = address.City__c,
                City__r = new City__c(Id = address.City__c)
            )
        );
        shippingSelector.selectFeeByLocation(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => cityWithoutStateRelation },
            products,
            new List<Shipping_Fee__c>()
        );

        Account_Address__c noCityAddress = new Account_Address__c(
            Name = 'Address Without City',
            Account__c = getClient().Id,
            Public_Space__c = 'Street',
            Postal_Code__c = '00000-001',
            District__c = 'District',
            Code__c = 105
        );
        insert noCityAddress;
        Order noCityOrderRecord = createOrder(noCityAddress);
        OrderItem noCityItem = createOrderItem(noCityOrderRecord);
        insert noCityItem;
    }

    @isTest
    static void selectMarginBranchesTest() {
        createSelectionRates();
        Account_Address__c address = getAddress();
        Order orderRecord = createOrder(address);
        Order fullOrder = [
            SELECT Id, Customer__c, Customer__r.Client_Group__c,
                   Account_Address__r.City__c,
                   Account_Address__r.City__r.State__c,
                   Account_Address__r.City__r.State__r.Country__c
            FROM Order
            WHERE Id = :orderRecord.Id
        ];
        Product2 product = getProduct();
        OrderItem helperItem = new OrderItem(OrderId = fullOrder.Id, Product2Id = product.Id);
        Map<Id, Order> orders = new Map<Id, Order>{ fullOrder.Id => fullOrder };
        Map<Id, Product2> products = new Map<Id, Product2>{ product.Id => product };
        Map<String, Margin__c> marginsByName = new Map<String, Margin__c>();
        for (Margin__c rate : [
            SELECT Id, Name, Product__c, Product_Hierarchy__c, Account__c, Account_Group__c,
                   City__c, State__c, Country__c, Value__c, CreatedDate
            FROM Margin__c
            WHERE Name LIKE 'Margin %'
        ]) {
            marginsByName.put(rate.Name, rate);
        }

        SelectMarginHelper marginSelector = new SelectMarginHelper();
        for (String marginName : marginsByName.keySet()) {
            OrderItem candidate = helperItem.clone(false, true, false, false);
            marginSelector.selectMargin(
                candidate,
                orders,
                products,
                new List<Margin__c>{ marginsByName.get(marginName) }
            );
            Assert.areEqual(marginName, candidate.Margin_Name__c);
        }

        OrderItem tieItem = helperItem.clone(false, true, false, false);
        marginSelector.selectMargin(
            tieItem,
            orders,
            products,
            new List<Margin__c>{
                marginsByName.get('Margin Produto Cliente Cidade'),
                marginsByName.get('Margin Produto Cliente Cidade Empate')
            }
        );
        Assert.areEqual('Margin Produto Cliente Cidade Empate', tieItem.Margin_Name__c);

        OrderItem guardedItem = helperItem.clone(false, true, false, false);
        marginSelector.selectMargin(
            guardedItem,
            new Map<Id, Order>(),
            products,
            new List<Margin__c>()
        );
        marginSelector.selectMargin(
            guardedItem,
            orders,
            new Map<Id, Product2>(),
            new List<Margin__c>()
        );
        marginSelector.selectMargin(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => new Order(Id = fullOrder.Id) },
            products,
            new List<Margin__c>()
        );

        Order noCityOrder = new Order(
            Id = fullOrder.Id,
            Account_Address__r = new Account_Address__c()
        );
        marginSelector.selectMargin(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => noCityOrder },
            products,
            new List<Margin__c>()
        );
        noCityOrder.Account_Address__r = new Account_Address__c(
            City__c = address.City__c
        );
        marginSelector.selectMargin(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => noCityOrder },
            products,
            new List<Margin__c>()
        );

        Order cityWithoutStateRelation = new Order(
            Id = fullOrder.Id,
            Account_Address__r = new Account_Address__c(
                City__c = address.City__c,
                City__r = new City__c(Id = address.City__c)
            )
        );
        marginSelector.selectMargin(
            guardedItem,
            new Map<Id, Order>{ fullOrder.Id => cityWithoutStateRelation },
            products,
            new List<Margin__c>()
        );
    }

    @isTest
    static void validationCNPJ() {
        Account client = getClient();
        try {
            insert new Account(
                Name = 'Invalid CNPJ Length',
                CNPJ__c = '1',
                Client_Group__c = client.Client_Group__c
            );
            Assert.fail('Vai caindo senhor, vai arrebatando.');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'CNPJ inválido! Informe exatamente 14 dígitos (Apenas números).'
                )
            );
        }

        try {
            insert new Account(
                Name = 'Blank CNPJ',
                CNPJ__c = '',
                Client_Group__c = client.Client_Group__c
            );
            Assert.fail('Vai caindo senhor, vai arrebatando.');
        } catch (DmlException error) {
            Assert.isTrue(error.getMessage().contains('CNPJ inválido!'));
        }

        Account formattedClient = new Account(
            Name = 'Formatted CNPJ',
            CNPJ__c = '98765432109876',
            Client_Group__c = client.Client_Group__c
        );
        insert formattedClient;
        Assert.areEqual('98.765.432/1098-76', formattedClient.CNPJ__c);
    }

    @isTest
    static void validationShipping() {
        Account_Address__c address = getAddress();
        Product2 product = getProduct();
        Distribution_Center__c center = getCenter();

        insert shippingFee('Valid Shipping', product.Id, null, address.City__c, null, null, 14.5);

        try {
            insert new Shipping_Fee__c(
                Name = 'Faltando a localizacao do frete',
                Product__c = product.Id,
                Distribution_Center__c = center.Id,
                Value__c = 15,
                Status__c = 'Approved'
            );
            Assert.fail('Vai caindo senhor, vai arrebatando');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'Campo: Cidade, Estado ou País precisam estar preenchidos!'
                )
            );
        }

        try {
            insert new Shipping_Fee__c(
                Name = 'Faltando o produto do frete',
                City__c = address.City__c,
                Distribution_Center__c = center.Id,
                Value__c = 16,
                Status__c = 'Approved'
            );
            Assert.fail('Expected shipping product validation to fail.');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'Campo: Produto ou Hierarquia de Produtos precisam estar preenchidos!'
                )
            );
        }

        try {
            insert shippingFee('Frete válido', product.Id, null, address.City__c, null, null, 14.5);

            Assert.fail('Esperado frete duplicado');
        } catch (DmlException error) {
            Assert.isTrue(error.getMessage().contains('Frete Duplicado!'));
        }
    }

    @isTest
    static void validationMargin() {
        Account client = getClient();
        Account_Address__c address = getAddress();
        Product2 product = getProduct();
        Distribution_Center__c center = getCenter();

        Margin__c validMargin = margin(
            'Margem valida',
            product.Id,
            null,
            client.Id,
            null,
            address.City__c,
            null,
            null,
            14.5
        );
        insert validMargin;

        try {
            insert new Margin__c(
                Name = 'Faltando a localizacao da margem',
                Product__c = product.Id,
                Account__c = client.Id,
                Distribution_Center__c = center.Id,
                Value__c = 15
            );
            Assert.fail('Espera que falhe por falta de parametros.');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'Campo: Cidade, Estado ou País precisam estar preenchidos!'
                )
            );
        }

        try {
            insert new Margin__c(
                Name = 'Faltando produto na margem',
                City__c = address.City__c,
                Account__c = client.Id,
                Distribution_Center__c = center.Id,
                Value__c = 16
            );
            Assert.fail('Espera-se que falhe por falta do produto.');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'Campo: Produto ou Hierarquia de Produtos precisam estar preenchidos!'
                )
            );
        }

        try {
            insert new Margin__c(
                Name = 'Faltando Cliente na margem',
                Product__c = product.Id,
                City__c = address.City__c,
                Distribution_Center__c = center.Id,
                Value__c = 17
            );
            Assert.fail('Espera-se que falhe por falta do cliente.');
        } catch (DmlException error) {
            Assert.isTrue(
                error.getMessage().contains(
                    'Campo: Cliente ou Grupo de Clientes precisam estar preenchidos!'
                )
            );
        }

        try {
            insert margin(
                'Margem valida',
                product.Id,
                null,
                client.Id,
                null,
                address.City__c,
                null,
                null,
                14.5
            );
            Assert.fail('Margem duplicada');
        } catch (DmlException error) {
            Assert.isTrue(error.getMessage().contains('Margem Duplicada!'));
        }
    }

    @isTest
    static void validationTax() {
        Product2 product = getProduct();
        Account_Address__c address = [
            SELECT City__r.State__c
            FROM Account_Address__c
            WHERE Name = :ADDRESS_NAME
            LIMIT 1
        ];
        Distribution_Center__c center = getCenter();
        Tax__c tax = new Tax__c(
            Name = 'Imposto valido',
            Product__c = product.Id,
            State__c = address.City__r.State__c,
            Distribution_Center__c = center.Id,
            Value__c = 14.5,
            Status__c = 'Approved'
        );
        insert tax;

        try {
            insert new Tax__c(
                Name = 'Imposto Duplicado',
                Product__c = product.Id,
                State__c = address.City__r.State__c,
                Distribution_Center__c = center.Id,
                Value__c = 14.5,
                Status__c = 'Approved'
            );
            Assert.fail('Expected duplicate tax validation to fail.');
        } catch (DmlException error) {
            Assert.isTrue(error.getMessage().contains('Imposto Duplicado!'));
        }
    }

    @isTest
    static void updateOrderPriceTest() {
        Account_Address__c originalAddress = getAddress();
        Order orderRecord = createOrder(originalAddress);
        OrderItem orderItem = createOrderItem(orderRecord);
        insert orderItem;

        Account_Address__c alternateAddress = new Account_Address__c(
            Name = 'Mudar endereco',
            Account__c = getClient().Id,
            City__c = originalAddress.City__c,
            Public_Space__c = 'Street',
            Postal_Code__c = '00000-002',
            District__c = 'District',
            Code__c = 106
        );
        insert alternateAddress;

        Main main = new Main();
        Order unchangedOrder = [
            SELECT Id, Customer__c, Account_Address__c, Status
            FROM Order
            WHERE Id = :orderRecord.Id
        ];

        Order oldUnchangedOrder = unchangedOrder.clone(true, true, false, false);
        main.updateOrder(
            new List<Order>{ unchangedOrder },
            new List<Order>{ oldUnchangedOrder }
        );

        Order changedCustomer = new Order(
            Id = orderRecord.Id,
            Customer__c = null,
            Account_Address__c = originalAddress.Id,
            Status = 'Draft'
        );

        main.updateOrder(
            new List<Order>{ changedCustomer },
            new List<Order>{ unchangedOrder }
        );

        Assert.isTrue(changedCustomer.hasErrors());

        Order activatedOrder = new Order(
            Id = orderRecord.Id,
            Customer__c = unchangedOrder.Customer__c,
            Account_Address__c = originalAddress.Id,
            Status = 'Draft'
        );
        Order oldActivatedOrder = new Order(
            Id = orderRecord.Id,
            Customer__c = unchangedOrder.Customer__c,
            Account_Address__c = originalAddress.Id,
            Status = 'Activated'
        );
        main.updateOrder(
            new List<Order>{ activatedOrder },
            new List<Order>{ oldActivatedOrder }
        );
        Assert.isTrue(activatedOrder.hasErrors());

        Test.startTest();
        Order updatedOrder = [
            SELECT Id, Account_Address__c
            FROM Order
            WHERE Id = :orderRecord.Id
        ];
        updatedOrder.Account_Address__c = alternateAddress.Id;
        update updatedOrder;
        Test.stopTest();

        Assert.isFalse(OrderItemUpdateHandler.bypassCustomizations);
        OrderItem recalculatedItem = [
            SELECT Id, Shipping_Cost__c, Tax_Percentage__c, Margin_Percentage__c,
                   Price_Without_Margin__c, UnitPrice, Discount__c
            FROM OrderItem
            WHERE Id = :orderItem.Id
        ];
        Assert.isNotNull(recalculatedItem.Id);
    }

    @isTest
    static void orderItemUpdateBranchesTest() {
        Order orderRecord = createOrder(getAddress());
        OrderItem insertedItem = createOrderItem(orderRecord);
        insert insertedItem;

        OrderItem oldItem = [
            SELECT Id, OrderId, Quantity, UnitPrice, ListPrice, TotalPrice,
                   Shipping_Cost__c, Tax_Percentage__c, Margin_Percentage__c,
                   Fee_Name__c, Tax_Name__c, Margin_Name__c
            FROM OrderItem
            WHERE Id = :insertedItem.Id
        ];
        Account_Address__c address = getAddress();
        oldItem.Order = new Order(Account_Address__c = address.Id);
        OrderItemUpdateHandler handler = new OrderItemUpdateHandler();

        OrderItem bypassedItem = oldItem.clone(true, true, true, true);
        OrderItemUpdateHandler.bypassCustomizations = true;
        handler.updateOrderItem(
            new List<OrderItem>{ bypassedItem },
            new List<OrderItem>{ oldItem }
        );
        OrderItemUpdateHandler.bypassCustomizations = false;
        Assert.areEqual(oldItem.Fee_Name__c, bypassedItem.Fee_Name__c);

        OrderItem unchangedItem = oldItem.clone(true, true, true, true);
        unchangedItem.Order = new Order(Account_Address__c = address.Id);
        new OrderItemUpdate().beforeUpdate(
            new List<OrderItem>{ unchangedItem },
            new List<OrderItem>{ oldItem }
        );
        Assert.areEqual(oldItem.Tax_Name__c, unchangedItem.Tax_Name__c);

        OrderItem changedItem = oldItem.clone(true, true, true, true);
        changedItem.Order = new Order(Account_Address__c = address.Id);
        changedItem.Shipping_Cost__c = 5;
        changedItem.Tax_Percentage__c = 6;
        changedItem.Margin_Percentage__c = 7;
        handler.updateOrderItem(
            new List<OrderItem>{ changedItem },
            new List<OrderItem>{ oldItem }
        );
        Assert.areEqual('Frete Personalizado', changedItem.Fee_Name__c);
        Assert.areEqual('Imposto Personalizado', changedItem.Tax_Name__c);
        Assert.areEqual('Margem Personalizada', changedItem.Margin_Name__c);
        Assert.isTrue(changedItem.UnitPrice > oldItem.UnitPrice);
        Assert.isTrue(changedItem.Price_Without_Margin__c > oldItem.ListPrice);

        Account_Address__c otherAddress = new Account_Address__c(
            Name = 'Endereco diferente',
            Account__c = getClient().Id,
            City__c = address.City__c,
            Public_Space__c = 'Street',
            Postal_Code__c = '00000-003',
            District__c = 'District',
            Code__c = 107
        );
        insert otherAddress;
        OrderItem differentAddressItem = oldItem.clone(true, true, true, true);
        differentAddressItem.Order = new Order(Account_Address__c = otherAddress.Id);
        differentAddressItem.Shipping_Cost__c = 5;
        differentAddressItem.Tax_Percentage__c = 6;
        differentAddressItem.Margin_Percentage__c = 7;
        handler.updateOrderItem(
            new List<OrderItem>{ differentAddressItem },
            new List<OrderItem>{ oldItem }
        );
        Assert.areEqual(oldItem.Fee_Name__c, differentAddressItem.Fee_Name__c);
        Assert.areEqual(oldItem.Tax_Name__c, differentAddressItem.Tax_Name__c);
        Assert.areEqual(oldItem.Margin_Name__c, differentAddressItem.Margin_Name__c);
    }

    @isTest
    static void orderItemValidationTest() {
        OrderItemValidation validation = new OrderItemValidation();
        OrderItem invalidItem = new OrderItem(Quantity = 0, UnitPrice = 0);
        Assert.isFalse(validation.validateOrderItem(invalidItem));
        Assert.isTrue(invalidItem.hasErrors());

        OrderItem validItem = new OrderItem(Quantity = 1, UnitPrice = 1);
        Assert.isTrue(validation.validateOrderItem(validItem));
        Assert.isFalse(validItem.hasErrors());

        Product2 product = getProduct();
        OrderItem orphanItem = new OrderItem(
            Product2Id = product.Id,
            Quantity = 0,
            ListPrice = 100,
            Shipping_Cost__c = 0,
            Tax_Percentage__c = 0,
            Margin_Percentage__c = 0
        );
        new Main().insertFees(new List<OrderItem>{ orphanItem });
        Assert.isTrue(orphanItem.hasErrors());

        Order orderRecord = createOrder(getAddress());
        OrderItem item = createOrderItem(orderRecord);
        insert item;
        OrderItem savedItem = [
            SELECT Id, OrderId, Product2Id, Quantity, UnitPrice, ListPrice, TotalPrice,
                   Shipping_Cost__c, Tax_Percentage__c, Margin_Percentage__c
            FROM OrderItem
            WHERE Id = :item.Id
        ];
        new InsertOrderPrice().beforeInsert(new List<OrderItem>{ savedItem });
    }
}
