package shop.clothing.service.Implement;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Color;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.ColorRepository;
import shop.clothing.repository.ProductRepository;
import shop.clothing.service.ColorService;

import java.util.List;

@Service
@AllArgsConstructor
public class ColorImplement implements ColorService {

    ColorRepository colorRepository;

    ProductRepository productRepository;


    @Override
    public boolean createColor(AttributeRequest attributeRequest) {
        if (colorRepository.existsByName(attributeRequest.getName()))
            throw new WebException(ErrorCode.COLOR_IS_EXISTS);
        Color color = new Color();
        color.setName(attributeRequest.getName());
        colorRepository.save(color);
        return true;
    }

    @Override
    public boolean deletedColor(AttributeRequest attributeRequest) {
        if (!colorRepository.existsByName(attributeRequest.getName()))
            throw new WebException(ErrorCode.COLOR_NOT_FOUND);
        Color color = colorRepository.findColorByName(attributeRequest.getName());
        if (productRepository.existsByColors(color))
            throw new WebException(ErrorCode.PRODUCT_HAS_COLOR);
        colorRepository.delete(color);
        return true;
    }

    @Override
    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }
}
