package com.ALOHCMUTE.model;


import lombok.*;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor

public class ProfileModel {
	private int profileId;
    private String avatar;
    private String background;
    private int userId;
}
