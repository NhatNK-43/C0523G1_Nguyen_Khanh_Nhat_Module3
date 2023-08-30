package com.example.exercise_12_1.service;

import com.example.exercise_12_1.model.User;

import java.util.List;

public interface IUserService {
    List<User> showList();
    void save(User user);
}
