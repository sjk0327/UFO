package com.use.first.visitor;

public interface VisitCountDAO {	
	
	public void insertVisitor(VisitCountVO vo);

	public int selectVisit();

	public int selectVisitToday(int one);

		
	}			

