package com.example.exercise_12_1.service;

import com.example.exercise_12_1.model.User;
import com.example.exercise_12_1.repository.IUserRepository;
import com.example.exercise_12_1.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }
}
