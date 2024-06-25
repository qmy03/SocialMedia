package com.ALOHCMUTE.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

import com.ALOHCMUTE.model.PostsModel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Comments")
public class Comments implements Serializable {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CommentId")
    private int commentId;
    
    @Column(name = "Content",columnDefinition = "nvarchar(2000)")
    private String content;
    
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "CreateTime")
    private Date createTime;
    
    @Lob
    @Column(name = "Image")
    private byte[] image;
    
//    @Column(name = "CommentReplyId")
//    private int commentReplyId;

    @ManyToOne
    @JoinColumn(name = "userId")
    private Users users;

    @ManyToOne
    @JoinColumn(name = "postId")
    private Posts posts;
//
//	@OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<Comments> comments;
//
//	@ManyToOne
//	@JoinColumn(name = "CommentReplyId")
//	private Comments parentComment;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Posts getPosts() {
		return posts;
	}

	public void setPosts(Posts posts) {
		this.posts = posts;
	}

}
