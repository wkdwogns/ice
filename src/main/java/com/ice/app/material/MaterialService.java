package com.ice.app.material;

import java.util.List;
import java.util.Map;

public interface MaterialService {

	List<Map<String, Object>> materialList(Map<String, Object> param);

	void materialInsertAction(Map<String, Object> param);

}
