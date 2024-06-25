package com.ALOHCMUTE.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name ="Posts")
public class Posts implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PostId")
    private int postId;
    
    @Column(name = "Content", columnDefinition = "nvarchar(2000)")
    private String content;
    
    @Lob
    @Column(name = "image_data")
    private byte[] imageData;

    
    @Column(name = "PostTime", columnDefinition = "nvarchar(2000)")
    private String postTime;
    
    @Column(name = "PrivacyLevel")
    private boolean privacyLevel;

    @ManyToOne
    @JoinColumn(name = "userId") // Tên cột foreign key trong bảng Comments
    private Users users;

    @OneToMany(mappedBy = "posts", cascade = CascadeType.ALL)
    private List<Likes> likes;

    @OneToMany(mappedBy = "posts", cascade = CascadeType.ALL)
    private List<Comments> comments;

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public byte[] getImageData() {
		return imageData;
	}

	public void setImageData(byte[] imageData) {
		this.imageData = imageData;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public boolean isPrivacyLevel() {
		return privacyLevel;
	}

	public void setPrivacyLevel(boolean privacyLevel) {
		this.privacyLevel = privacyLevel;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public List<Likes> getLikes() {
		return likes;
	}

	public void setLikes(List<Likes> likes) {
		this.likes = likes;
	}

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

    
}
