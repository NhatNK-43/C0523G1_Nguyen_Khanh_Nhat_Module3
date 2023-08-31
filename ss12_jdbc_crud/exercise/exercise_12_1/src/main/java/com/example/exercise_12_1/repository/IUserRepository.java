package com.example.exercise_12_1.repository;

import com.example.exercise_12_1.model.User;

import java.util.List;

public interface IUserRepository {
    User findById(int id);
    List<User> showList();
    void save(User user);
    void update(int idUpdate, User user);
    void delete(int id);
    List<User> showListSort();
    List<User> searchByCountryList(String countrySearch);
}
