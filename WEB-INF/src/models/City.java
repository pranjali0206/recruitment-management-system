
package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeSet;
import utils.DBConnect;

public class City implements Comparable<City> {
    private Integer cityId;
    private String name;
    private State state;

    // Constructors
    public City() {
    }
    public City(String name) {
        this.name = name;
    }
    public City(Integer cityId) {
        this.cityId = cityId;
    }

    public City(Integer cityId, String name) {
        this.cityId = cityId;
        this.name = name;
    }

    public City(Integer cityId, String name, State state) {
        this.cityId = cityId;
        this.name = name;
        this.state = state;
    }

    // Methods
    public static TreeSet<City> collectAllCities() {
        TreeSet<City> cities = new TreeSet<>();
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT c.city_id, c.city, s.state_id, s.state AS state_name " +
                 "FROM cities AS c INNER JOIN states AS s ON c.state_id = s.state_id"
             );
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                cities.add(new City(
                    rs.getInt("city_id"),
                    rs.getString("city"),
                    new State(rs.getInt("state_id"), rs.getString("state_name"))
                ));
            }
        } catch (SQLException e) {
            System.err.println("SQLException in collectAllCities: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("################### Cities loaded: " + cities.size() + " ###########################");
        return cities;
    }

    @Override
    public int compareTo(City other) {
        // Compare by city name, then state name if cities are equal
        int cityCompare = this.name != null && other.name != null ? this.name.compareTo(other.name) : 0;
        if (cityCompare != 0) {
            return cityCompare;
        }
        String thisState = this.state != null && this.state.getState() != null ? this.state.getState() : "";
        String otherState = other.state != null && other.state.getState() != null ? other.state.getState() : "";
        return thisState.compareTo(otherState);
    }

    @Override
    public String toString() {
        return name + ", " + (state != null ? state.getState() : "Unknown State");
    }

    // Getters and Setters
    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
}
