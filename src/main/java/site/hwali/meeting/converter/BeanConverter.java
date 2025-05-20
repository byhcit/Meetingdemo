package site.hwali.meeting.converter;

import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.stream.Collectors;

public class BeanConverter {

    /**
     * 将源对象转换为目标对象
     * @param source 源对象
     * @param targetClass 目标类
     * @param <S> 源类型
     * @param <T> 目标类型
     * @return 目标对象
     */
    public static <S, T> T convert(S source, Class<T> targetClass) {
        if (source == null) {
            return null;
        }

        try {
            T target = targetClass.getDeclaredConstructor().newInstance();
            BeanUtils.copyProperties(source, target);
            return target;
        } catch (Exception e) {
            throw new RuntimeException("Failed to convert source to target", e);
        }
    }

    /**
     * 将源对象列表转换为目标对象列表
     * @param sourceLst 源对象列表
     * @param targetClass 目标类
     * @param <S> 源类型
     * @param <T> 目标类型
     * @return 目标对象列表
     */
    public static <S, T> List<T> convertLst(List<S> sourceLst, Class<T> targetClass) {
        if (CollectionUtils.isEmpty(sourceLst)) {
            return new ArrayList<>();
        }

        List<T> targetLst = sourceLst.parallelStream().map(source -> convert(source, targetClass)).toList();
        return targetLst;
    }


    /**
     * 将源对象转换为目标对象，支持自定义转换器
     * @param source 源对象
     * @param targetClass 目标类
     * @param customConverter 自定义转换器
     * @param <S> 源类型
     * @param <T> 目标类型
     * @return 目标对象
     */
    public static <S, T> T convert(S source, Class<T> targetClass, BiConsumer<S, T> customConverter) {
        T target = convert(source, targetClass);
        if (target != null && customConverter != null) {
            customConverter.accept(source, target);
        }
        return target;
    }


    /**
     * 将源对象列表转换为目标对象列表，支持自定义转换器
     * @param sourceList 源对象列表
     * @param targetClass 目标类
     * @param customConverter 自定义转换器
     * @param <S> 源类型
     * @param <T> 目标类型
     * @return 目标对象列表
     */
    public static <S, T> List<T> convertList(List<S> sourceList, Class<T> targetClass,
                                             BiConsumer<S, T> customConverter) {
        if (CollectionUtils.isEmpty(sourceList)) {
            return new ArrayList<>();
        }

        return sourceList.parallelStream()
                .map(source -> convert(source, targetClass, customConverter))
                .collect(Collectors.toList());
    }
}
