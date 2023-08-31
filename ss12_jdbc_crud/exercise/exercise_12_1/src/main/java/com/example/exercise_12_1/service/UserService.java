package com.example.exercise_12_1.service;

import com.example.exercise_12_1.model.User;
import com.example.exercise_12_1.repository.IUserRepository;
import com.example.exercise_12_1.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void update(int idUpdate, User user) {
        userRepository.update(idUpdate,user);
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public List<User> showListSort() {
        return userRepository.showListSort();
    }

    @Override
    public List<User> searchByCountryList(String countrySearch) {
        countrySearch = "%"+countrySearch+"%";
        return userRepository.searchByCountryList(countrySearch);
    }
}
