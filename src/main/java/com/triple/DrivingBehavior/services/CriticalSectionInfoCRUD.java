package com.triple.DrivingBehavior.services;

import java.util.List;

import com.triple.DrivingBehavior.domain.CriticalSectionInfo;

public interface CriticalSectionInfoCRUD {
public void add(CriticalSectionInfo info);
public List<CriticalSectionInfo> getbyNo(String no);
public CriticalSectionInfo getbyId(Long id);
public void editById(Long id,CriticalSectionInfo newinfo);
public void deleteById(Long id);
}
