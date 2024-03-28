package com.tech.ibara.main.dao;

import java.util.ArrayList;

import com.tech.ibara.main.dto.BizPreviewDto;
import com.tech.ibara.main.dto.OHPreviewDto;

public interface MainDao {
	ArrayList<BizPreviewDto> bizPreview();
	ArrayList<OHPreviewDto> ohPreview();
}
