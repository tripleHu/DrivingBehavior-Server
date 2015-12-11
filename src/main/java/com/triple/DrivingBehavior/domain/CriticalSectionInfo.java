package com.triple.DrivingBehavior.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CriticalSectionInfo")
public class CriticalSectionInfo {
	//自动增长的逻辑主键
			@Id
			@GeneratedValue
			private long id;
	//公交车线路
			@Column(length=20,nullable=false,unique=false)
			private String no;
	//公交车站
			@Column(length=20,nullable=false,unique=false)
			private String busstation;
	//车站标号
			@Column(length=20,nullable=false,unique=false)
			private int busstationno;
	//GPS位置经度
			@Column(length=20,nullable=false,unique=false)
			private double longitude;
	//GPS位置纬度
		    @Column(length=20,nullable=false,unique=false)
			private double latitude;
	//往返标记
		    @Column(length=20,nullable=false,unique=false)
			private boolean flag;
    //高峰时段标记
		    @Column(length=20,nullable=false,unique=false)
			private boolean rushhour;
	 //最高速度
		    @Column(length=20,nullable=false,unique=false)
			private float maxspeed;
	//最低速度
		    @Column(length=20,nullable=false,unique=false)
			private float minspeed;
	 //最大加速度
		    @Column(length=20,nullable=false,unique=false)
			private float max_acceleration;
	//最小加速度
		    @Column(length=20,nullable=false,unique=false)
			private float min_acceleration;
			public long getId() {
				return id;
			}
			public void setId(long id) {
				this.id = id;
			}
			public String getNo() {
				return no;
			}
			public void setNo(String no) {
				this.no = no;
			}
			public String getBusstation() {
				return busstation;
			}
			public void setBusstation(String busstation) {
				this.busstation = busstation;
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
			public boolean getFlag() {
				return flag;
			}
			public void setFlag(boolean flag) {
				this.flag = flag;
			}
			public boolean getRushhour() {
				return rushhour;
			}
			public void setRushhour(boolean rushhour) {
				this.rushhour = rushhour;
			}
			public float getMaxspeed() {
				return maxspeed;
			}
			public void setMaxspeed(float maxspeed) {
				this.maxspeed = maxspeed;
			}
			public float getMinspeed() {
				return minspeed;
			}
			public void setMinspeed(float minspeed) {
				this.minspeed = minspeed;
			}
			public float getMax_acceleration() {
				return max_acceleration;
			}
			public void setMax_acceleration(float max_acceleration) {
				this.max_acceleration = max_acceleration;
			}
			public float getMin_acceleration() {
				return min_acceleration;
			}
			public void setMin_acceleration(float min_acceleration) {
				this.min_acceleration = min_acceleration;
			}
			public int getBusstationno() {
				return busstationno;
			}
			public void setBusstationno(int busstationno) {
				this.busstationno = busstationno;
			}

}
