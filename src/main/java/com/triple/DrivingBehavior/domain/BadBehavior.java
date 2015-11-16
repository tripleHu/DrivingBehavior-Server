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
}
