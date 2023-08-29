package com.example.exercise_10_1.repository;

import com.example.exercise_10_1.model.Customer;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerList {
    private static List<Customer> customerList ;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", LocalDate.parse("1983-08-20"),"Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNx30I3wOVhpB0-vHXP1HYSW9XVooNAGaJURYas9hEnkvFTPrdpV2CyeNZMOT-TKcfctY&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Văn Nam", LocalDate.parse("1983-08-21"),"Bắc Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNx30I3wOVhpB0-vHXP1HYSW9XVooNAGaJURYas9hEnkvFTPrdpV2CyeNZMOT-TKcfctY&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Thái Hòa", LocalDate.parse("1983-08-22"),"Nam Định","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNx30I3wOVhpB0-vHXP1HYSW9XVooNAGaJURYas9hEnkvFTPrdpV2CyeNZMOT-TKcfctY&usqp=CAU"));
        customerList.add(new Customer("Trần Đăng Khoa", LocalDate.parse("1983-08-17"),"Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNx30I3wOVhpB0-vHXP1HYSW9XVooNAGaJURYas9hEnkvFTPrdpV2CyeNZMOT-TKcfctY&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Đình Thi", LocalDate.parse("1983-08-17"),"Hà Nội","https://toigingiuvedep.vn/wp-content/uploads/2021/07/hinh-ve-don-gian-va-de-thuong-nhat.jpg"));
    }
    public static List<Customer> getCustomerList(){
        return customerList;
    }
}
