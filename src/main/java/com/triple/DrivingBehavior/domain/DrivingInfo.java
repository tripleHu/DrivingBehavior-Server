package com.triple.DrivingBehavior.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="DrivingInfo")
public class DrivingInfo 
{

		//自动增长的逻辑主键
		@Id
		@GeneratedValue
		private long id;
	//时间
		@Column(length=20,nullable=false,unique=false)
		private Date time;
	//GPS位置经度
		@Column(length=20,nullable=false,unique=false)
		private float longitude;
	//GPS位置纬度
	    @Column(length=20,nullable=false,unique=false)
		private float latitude;
	//速度
		@Column(length=20,nullable=false,unique=false)
		private float velocity;
	//方向
		@Column(length=20,nullable=false,unique=false)
		private float orientation;
	//设置外键依赖
		@ManyToOne(optional=false)
		private User user;
	//get set方法
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
		public float getVelocity() {
			return velocity;
		}
		public void setVelocity(float velocity) {
			this.velocity = velocity;
		}
		public float getOrientation() {
			return orientation;
		}
		public void setOrientation(float orientation) {
			this.orientation = orientation;
		}
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public float getLongitude() {
			return longitude;
		}
		public void setLongitude(float longitude) {
			this.longitude = longitude;
		}
		public float getLatitude() {
			return latitude;
		}
		public void setLatitude(float latitude) {
			this.latitude = latitude;
		}
}