package com.triple.DrivingBehavior.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="BadBehavior")
public class BadBehavior {
	//自动增长的逻辑主键
			@Id
			@GeneratedValue
			private long id;
		//时间
			@Column(length=20,nullable=false,unique=false)
			private Date time;
			//GPS位置经度
			@Column(length=20,nullable=false,unique=false)
			private double longitude;
		//GPS位置纬度
		    @Column(length=20,nullable=false,unique=false)
			private double latitude;
		//速度
			@Column(length=20,nullable=false,unique=false)
			private float velocity;
		//原因
			@Column(length=100,nullable=false,unique=false)
			private String Reason;
			//设置外键依赖
			@ManyToOne(optional=false)
			private User user;
			
			public long getId() {
				return id;
			}
			public void setId(long id) {
				this.id = id;
			}
			public Date getTime() {
				return time;
			}
			public void setTime(Date time) {
				this.time = time;
			}
			public double getLongitude() {
				return longitude;
			}
			public void setLongitude(double longitude) {
				this.longitude = longitude;
			}
			public double getLatitude() {
				return latitude;
			}
			public void setLatitude(double latitude) {
				this.latitude = latitude;
			}
			public float getVelocity() {
				return velocity;
			}
			public void setVelocity(float velocity) {
				this.velocity = velocity;
			}
			public String getReason() {
				return Reason;
			}
			public void setReason(String reason) {
				Reason = reason;
			}
			public User getUser() {
				return user;
			}
			public void setUser(User user) {
				this.user = user;
			}
}
