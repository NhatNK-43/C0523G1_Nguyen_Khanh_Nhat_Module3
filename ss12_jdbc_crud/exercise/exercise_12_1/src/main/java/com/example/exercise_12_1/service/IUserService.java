package com.example.exercise_12_1.service;

import com.example.exercise_12_1.model.User;

import java.util.List;

public interface IUserService {
    User findById(int id);
    List<User> showList();
    void save(User user);
    void update(int idUpdate, User user);
    void delete(int id);
}