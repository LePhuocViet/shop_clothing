package shop.clothing.service;

import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Size;

import java.util.List;

public interface SizeService {
    boolean createSize(AttributeRequest attributeRequest);

    boolean deletedSize(AttributeRequest attributeRequest);

    List<Size> getAllSize();
}
