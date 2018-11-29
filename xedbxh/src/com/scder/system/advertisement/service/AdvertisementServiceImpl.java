package com.scder.system.advertisement.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.system.advertisement.dao.AdvertisementDao;
@Service("advertisementservice")
@Transactional
public class AdvertisementServiceImpl extends BaseServiceSupport implements AdvertisementService {
AdvertisementDao advertisementdao;
	@Override
	@Resource(name="advertisementdao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		this.advertisementdao = (AdvertisementDao)basedao;
	}

}
