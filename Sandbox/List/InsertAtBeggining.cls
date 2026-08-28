/*
Implement a method that would take an element and a 
List of elements as arguments and return the same List with the element inserted at the 0th position.
*/

public void insertAtStart(String cityName, List<String> cities) {
    if(cities.size() > 1){ cities.add(0, cityName); } else

    { cities.add(cityName); }

}