package shop.clothing.service.Implement;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Size;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.ProductRepository;
import shop.clothing.repository.SizeRepository;
import shop.clothing.service.SizeService;

import java.util.List;

@Service
@AllArgsConstructor
public class SizeImplement implements SizeService {

    SizeRepository sizeRepository;

    ProductRepository productRepository;
    @Override
    public boolean createSize(AttributeRequest attributeRequest) {
        if (sizeRepository.existsByName(attributeRequest.getName()))
            throw new WebException(ErrorCode.SIZE_IS_EXISTS);
        Size size = new Size();
        size.setName(attributeRequest.getName());
        sizeRepository.save(size);
        return true;
    }

    @Override
    public boolean deletedSize(AttributeRequest attributeRequest) {
        if(!sizeRepository.existsByName(attributeRequest.getName()))
            throw new WebException(ErrorCode.SIZE_NOT_FOUND);
        Size size = sizeRepository.findSizeByName(attributeRequest.getName());
        if (productRepository.existsBySizes(size))
            throw new WebException(ErrorCode.PRODUCT_HAS_SIZE);
        sizeRepository.delete(size);
        return true;
    }

    @Override
    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }
}
