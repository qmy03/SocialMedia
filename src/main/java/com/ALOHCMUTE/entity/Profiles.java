package com.ALOHCMUTE.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.ALOHCMUTE.repository.UserRepository;

import lombok.*;

@Entity
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name ="Profiles")
public class Profiles implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProfileId")
    private int profileId;
    
    @Column(name = "Avatar", columnDefinition = "nvarchar(2000)")
    private String avatar;
    
    @Column(name = "Background", columnDefinition = "nvarchar(2000)")
    private String background;

    @OneToOne
    @JoinColumn(name = "userId")
    private Users users;

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}


}
