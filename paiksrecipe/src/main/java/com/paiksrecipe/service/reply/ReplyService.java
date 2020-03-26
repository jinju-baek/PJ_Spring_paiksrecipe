package com.paiksrecipe.service.reply;

import java.util.List;

import com.paiksrecipe.domain.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno);
	
	public void insert(ReplyDTO rDto);
}
