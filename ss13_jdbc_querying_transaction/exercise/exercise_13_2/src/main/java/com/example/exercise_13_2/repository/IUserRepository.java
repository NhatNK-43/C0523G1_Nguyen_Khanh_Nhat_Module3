package com.example.exercise_13_2.repository;

import com.example.exercise_13_2.model.User;

import java.util.List;

public interface IUserRepository {
    User findById(int id);
    List<User> showList();
    void save(User user);
    void update(int idUpdate, User user);
    void delete(int idDelete);
    List<User> showListSort();
    List<User> searchByCountryList(String countrySearch);
    void addUserTransaction(User user, List<Integer> permissions);
}
