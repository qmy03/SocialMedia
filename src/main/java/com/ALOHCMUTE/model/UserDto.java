package com.ALOHCMUTE.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto implements Serializable {


	private String email;
    private String userName;
    private String password;
    private String CheckPass;

    public UserDto() {};

	public UserDto(String email, String userName, String password) {
        this.email = email;
        this.userName = userName;
        this.password = password;
    }


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCheckPass() {
		return CheckPass;
	}


	public void setCheckPass(String checkPass) {
		CheckPass = checkPass;
	}


}
