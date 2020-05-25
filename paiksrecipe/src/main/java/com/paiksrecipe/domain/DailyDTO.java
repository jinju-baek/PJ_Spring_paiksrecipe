package com.paiksrecipe.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DailyDTO {
	   private int dno;
	   private String content;
	   private String writer;
	   private Date regdate;
}