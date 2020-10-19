package com.cos.board.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Getter, Setter 합쳐져 있음. + toString() 구현되어 있음
//@Getter
//@Setter
@AllArgsConstructor // 전체 파라미터를 가진 생성자
@NoArgsConstructor // 파라미터가 없는 생성자
@Builder // 빌더 패턴
@Entity // ORM
public class Board {
	@Id // 기본키 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 해당 DB 번호증가 전략을 따라가기
	private int id;
	private String title;
	@Column(length = 100000)
	private String content;
	private int readCount;
	@CreationTimestamp // 자동으로 날짜 컬럼 값을 넣어준다.	
	private Timestamp createDate;
}
