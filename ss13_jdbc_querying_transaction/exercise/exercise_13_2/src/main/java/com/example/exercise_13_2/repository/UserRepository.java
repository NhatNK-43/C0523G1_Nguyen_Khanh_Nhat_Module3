package com.example.exercise_13_2.repository;

import com.example.exercise_13_2.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class UserRepository implements IUserRepository {
    private static final String SELECT = "call show_list()";
    private static final String INSERT = "call add_user(?,?,?)";
    private static final String INSERT_USER_SQL = "insert into users(name,email,country,is_delete) values (?,?,?,b'0');";
    private static final String INSERT_USER_PERMISSION_SQL = "insert into users(name,email,country,is_delete) values (?,?,?,b'0');";
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

    @Override
    public void addUserTransaction(User user, List<Integer> permissions) {
        Connection connection =null;
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatementAssignment = null;
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;

        try{
            connection = BaseRepository.getConnection();
            connection.setAutoCommit(false);

            preparedStatement = connection.prepareStatement(INSERT_USER_SQL, RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowAffceted = preparedStatement.executeUpdate();

            resultSet = preparedStatement.getGeneratedKeys();

            int userId = 0;
            if(resultSet.next()){
                userId = resultSet.getInt(1);
            }

            if(rowAffceted==1){
                String sqlPivot = "insert into user_permission(user_id,permission_id)"
                        + "values(?,?)";
                preparedStatementAssignment = connection.prepareStatement(sqlPivot);

                for(int permissionId : permissions){
                    preparedStatementAssignment.setInt(1, userId);
                    preparedStatementAssignment.setInt(2, permissionId);
                    preparedStatementAssignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException ex) {
            try {
                if (connection != null)
                    connection.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (preparedStatementAssignment != null) preparedStatementAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}
