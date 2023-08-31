package com.example.exercise_13_1.repository;

import com.example.exercise_13_1.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String SELECT = "call show_list()";
    private static final String INSERT = "call add_user(?,?,?)";
    private static final String UPDATE = "call update_user(?,?,?,?)";
    private static final String DELETE = "call delete_user(?)";
    private static final String SEARCH_COUNTRY = "select id, name, email, country from user_management.users \n" +
            "where country like ? and is_delete = 0;";

    @Override
    public User findById(int id) {
        for (User user:showList()){
            if(user.getId()==id){
                return user;
            }
        }
        return null;
    }

    @Override
    public List<User> showList() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void save(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(int idUpdate, User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, idUpdate);
            callableStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int idDelete) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1,idDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> showListSort() {
        List<User> userListSort = showList();
        Collections.sort(userListSort);
        return userListSort;
    }

    @Override
    public List<User> searchByCountryList(String countrySearch) {
        List<User> searchList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_COUNTRY);
            preparedStatement.setString(1,countrySearch);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                searchList.add(new User(id, name, email, country));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return searchList;
    }
}
