package com.picaboo.nor.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.picaboo.nor.customer.mapper.CustomerMapper;
import com.picaboo.nor.customer.vo.*;
import com.picaboo.nor.franchisee.vo.*;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
	@Autowired private CustomerMapper customerMapper;
	
	//데이터베이스의 저장된 좌석 가져오는 서비스
	@Override
	public List<Seat> getSeat(String franchiseeNo) {
		List<Seat> seat = customerMapper.selectSeat(franchiseeNo);
		List<FoodReservation>  food = customerMapper.selectFoodReservation(franchiseeNo);
		for(Seat l:seat) {
			//System.out.println(l.getSeatUse());
			switch(l.getSeatUse()) {
				case "R":
					//System.out.println(l.getSeatNo()+"예약");
					List<SeatReservation> seatList = customerMapper.selectSeatReservation(franchiseeNo);
					for (SeatReservation SL : seatList) {
						System.out.println(SL);
						if(l.getSeatNo() == SL.getSeatNo()) {
							//System.out.println(SL.getSeatNo());
							SeatReservation seatReservation = new SeatReservation();
							seatReservation.setFranchiseeNo(franchiseeNo);
							seatReservation.setSeatNo(SL.getSeatNo());
							//System.out.println("예약 삭제");
							customerMapper.insertCancelSeatReaservation(SL);
							customerMapper.deleteSeatReservation(seatReservation);
							seatReservation.setType("N");
							//System.out.println("좌석 타입 변경");
							customerMapper.updateSeatType(seatReservation);
						}
					}
			}
		}
		for(FoodReservation f:food) {
			System.out.println(f);
			customerMapper.insertCancelFoodReservation(f);
			customerMapper.deleteFoodReservation(f.getReservationNo());
		}
		
		return seat;
	}
	
	//프렌차이즈번호를 가져오는 서비스
	@Override
	public List<Franchisee> getFranchiseeNo() {
		return customerMapper.selectFranchiseeNo();
	}
	
	//프렌차이즈 상세정보를 가져오는 서비스
	@Override
	public Franchisee getFranchisee(String franchiseeNo) {
		
		return customerMapper.selectFranchisee(franchiseeNo);
	}
	
	//좌석 예약을 하는 서비스
	@Override
	public void addSeatReservation(SeatReservation seatReservation) {
		System.out.println("service"+seatReservation);
		
		customerMapper.insertSeatReservation(seatReservation);
		customerMapper.updateSeatType(seatReservation);
		 
	}
	
	//프렌차이즈의 대표이미지를 가져오는 서비스
	@Override
	public List<FranchiseePic> getFranchiseeThumbnail() {
		
		return customerMapper.selectFranchiseeThumbnail();
	}
	
	//선택된 프렌차이즈의 사진리스트를 가져오는 서비스
	@Override
	public List<FranchiseePic> getFranchiseeThumbnailList(String franchiseeNo) {
		//System.out.println(franchiseeNo);
		return customerMapper.selectFranchiseeThumbnailList(franchiseeNo);
	}
	
	//선택된 프렌차이즈에 등록된 상품 리스트를 가져오는 서비스
	@Override
	public List<Food> getFoodList(String franchiseeNo) {
		//System.out.println(franchiseeNo);
		List<Food> list = customerMapper.selectFoodList(franchiseeNo);
		//System.out.println(list);
		return list;
	}
	
	//프렌차이즈의 스펙 리스트를 가져오는 서비스
	@Override
	public List<FranchiseeSpec> getFranchiseeSpecList() {
		
		return customerMapper.selectSpecList();
	}
	
	//상품을 예약하는 서비스
	@Override
	public void addFoodReservation(FoodReservation foodReservation) {
		System.out.println("service"+foodReservation);
		customerMapper.insertFoodReservation(foodReservation);
		 
	}
}
