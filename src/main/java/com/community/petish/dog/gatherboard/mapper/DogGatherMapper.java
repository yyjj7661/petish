package com.community.petish.dog.gatherboard.mapper;

import java.util.List;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherParticipantVO;
import com.community.petish.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.dog.gatherboard.domain.MemberVO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherListDTO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherParticipantDTO;

public interface DogGatherMapper {
	List<DogGatherPostVO> getDogGatherList();
	List<DogGatherListDTO> getListWithPaging(Criteria cri);
	int getDogGatherPostCount(Criteria cri);
	DogGatherPostVO getDogGatherPost(Long postID);
	int updateViewCount(Long postID);
	int insertDogGatherPost(DogGatherPostVO dogGatherPostVO);
	int modifyDogGatherPost(DogGatherPostVO dogGatherPostVO);
	int deleteDogGatherPost(Long postID);
	int insertDogGatherParticipant(DogGatherParticipantVO participantVO);
	List<DogGatherParticipantDTO> getDogGatherParticipantList(Long postID);
	int getDogGatherParticipant(DogGatherParticipantVO participantVO);
	int cancelParticipant(DogGatherParticipantDTO participantDTO);
	void allCancelParticipant(Long postID);
	int getDogGatherParticipantCount(Long postID);
	Long getUserID(String username);
	String getUserName(Long userID);
	Long getDogSpeciesID(String dogSpecies);
	String getDogSpecies(Long speciesID);
	Long getDogSizeID(Long speciesID);
	List<DogSpeciesVO> getDogSpeciesList(Long sizeID);
	Long getRegionID(String regionName);
}
