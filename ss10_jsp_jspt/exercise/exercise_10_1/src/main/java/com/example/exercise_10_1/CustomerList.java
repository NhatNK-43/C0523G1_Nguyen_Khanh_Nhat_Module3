package com.example.exercise_10_1;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerList {
    private static List<Customer> customerList ;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", LocalDate.parse("1983-08-20"),"Hà Nội","https://www.google.com/url?sa=i&url=https%3A%2F%2Fhaycafe.vn%2Fanh-chan-dung%2F&psig=AOvVaw1JMT5YswnwPcJ5nI8u8rHt&ust=1693303086224000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjfm9qL_4ADFQAAAAAdAAAAABAE"));
        customerList.add(new Customer("Nguyễn Văn Nam", LocalDate.parse("1983-08-21"),"Bắc Giang","https://www.google.com/url?sa=i&url=https%3A%2F%2Fcamlo5.com%2Fanh-chan-dung-toan-tap%2F&psig=AOvVaw1JMT5YswnwPcJ5nI8u8rHt&ust=1693303086224000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjfm9qL_4ADFQAAAAAdAAAAABAJ"));
        customerList.add(new Customer("Nguyễn Thái Hòa", LocalDate.parse("1983-08-22"),"Nam Định","https://www.google.com/url?sa=i&url=https%3A%2F%2Fthanhnien.vn%2Fchan-dung-9x-viet-do-hoa-3d-cho-phim-bom-tan-cua-hollywood-185547934.htm&psig=AOvVaw1JMT5YswnwPcJ5nI8u8rHt&ust=1693303086224000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjfm9qL_4ADFQAAAAAdAAAAABAQ"));
        customerList.add(new Customer("Trần Đăng Khoa", LocalDate.parse("1983-08-17"),"Hà Tây","https://www.google.com/url?sa=i&url=https%3A%2F%2Fstudiochupanhdep.com%2Fanh-chan-dung-nam_222.html&psig=AOvVaw1JMT5YswnwPcJ5nI8u8rHt&ust=1693303086224000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjfm9qL_4ADFQAAAAAdAAAAABAd"));
        customerList.add(new Customer("Nguyễn Đình Thi", LocalDate.parse("1983-08-17"),"Hà Nội","https://www.google.com/url?sa=i&url=https%3A%2F%2Fyody.vn%2Fchup-anh-chan-dung-dep&psig=AOvVaw1JMT5YswnwPcJ5nI8u8rHt&ust=1693303086224000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOjfm9qL_4ADFQAAAAAdAAAAABAk"));
    }
    public static List<Customer> getCustomerList(){
        return customerList;
    }
}
