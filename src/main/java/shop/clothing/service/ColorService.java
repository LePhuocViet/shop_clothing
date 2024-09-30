package shop.clothing.service;

import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Color;


import java.util.List;

public interface ColorService {
    boolean createColor(AttributeRequest attributeRequest);

    boolean deletedColor(AttributeRequest attributeRequest);

    List<Color> getAllColor();

}
