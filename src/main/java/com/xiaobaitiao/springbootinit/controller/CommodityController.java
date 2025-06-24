package com.xiaobaitiao.springbootinit.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaobaitiao.springbootinit.annotation.AuthCheck;
import com.xiaobaitiao.springbootinit.common.BaseResponse;
import com.xiaobaitiao.springbootinit.common.DeleteRequest;
import com.xiaobaitiao.springbootinit.common.ErrorCode;
import com.xiaobaitiao.springbootinit.common.ResultUtils;
import com.xiaobaitiao.springbootinit.constant.UserConstant;
import com.xiaobaitiao.springbootinit.exception.BusinessException;
import com.xiaobaitiao.springbootinit.exception.ThrowUtils;
import com.xiaobaitiao.springbootinit.model.dto.commodity.*;
import com.xiaobaitiao.springbootinit.model.dto.commodityOrder.CommodityOrderQueryRequest;
import com.xiaobaitiao.springbootinit.model.dto.commodityOrder.PayCommodityOrderRequest;
import com.xiaobaitiao.springbootinit.model.entity.Commodity;
import com.xiaobaitiao.springbootinit.model.entity.CommodityOrder;
import com.xiaobaitiao.springbootinit.model.entity.CommodityScore;
import com.xiaobaitiao.springbootinit.model.entity.User;
import com.xiaobaitiao.springbootinit.model.vo.CommodityVO;
import com.xiaobaitiao.springbootinit.service.CommodityOrderService;
import com.xiaobaitiao.springbootinit.service.CommodityScoreService;
import com.xiaobaitiao.springbootinit.service.CommodityService;
import com.xiaobaitiao.springbootinit.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品表接口
 *
 * @author 程序员小白条
 * @from <a href="https://luoye6.github.io/"> 个人博客
 */
@RestController
@RequestMapping("/commodity")
@Slf4j
public class CommodityController {

    @Resource
    private CommodityService commodityService;
    @Resource
    private CommodityScoreService commodityScoreService;
    @Resource
    private UserService userService;
    @Resource
    private TransactionTemplate transactionTemplate;
    @Resource
    private CommodityOrderService commodityOrderService;
    // region 增删改查

    /**
     * 创建商品表
     *
     * @param commodityAddRequest
     * @param request
     * @return
     */
    @PostMapping("/add")
    public BaseResponse<Long> addCommodity(@RequestBody CommodityAddRequest commodityAddRequest, HttpServletRequest request) {
        ThrowUtils.throwIf(commodityAddRequest == null, ErrorCode.PARAMS_ERROR);
        // todo 在此处将实体类和 DTO 进行转换
        Commodity commodity = new Commodity();
        BeanUtils.copyProperties(commodityAddRequest, commodity);
        // 数据校验
        commodityService.validCommodity(commodity, true);
        // todo 填充默认值
        User loginUser = userService.getLoginUser(request);
        commodity.setAdminId(loginUser.getId());
        // 写入数据库
        boolean result = commodityService.save(commodity);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        // 返回新写入的数据 id
        long newCommodityId = commodity.getId();
        return ResultUtils.success(newCommodityId);
    }

    /**
     * 删除商品表
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteCommodity(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        long id = deleteRequest.getId();
        // 判断是否存在
        Commodity oldCommodity = commodityService.getById(id);
        ThrowUtils.throwIf(oldCommodity == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅管理员可删除
        if (!userService.isAdmin(request)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        // 操作数据库
        boolean result = commodityService.removeById(id);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        return ResultUtils.success(true);
    }

    /**
     * 更新商品表（仅管理员可用）
     *
     * @param commodityUpdateRequest
     * @return
     */
    @PostMapping("/update")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Boolean> updateCommodity(@RequestBody CommodityUpdateRequest commodityUpdateRequest) {
        if (commodityUpdateRequest == null || commodityUpdateRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Commodity commodity = new Commodity();
        BeanUtils.copyProperties(commodityUpdateRequest, commodity);
        // 数据校验
        commodityService.validCommodity(commodity, false);
        // 判断是否存在
        long id = commodityUpdateRequest.getId();
        Commodity oldCommodity = commodityService.getById(id);
        ThrowUtils.throwIf(oldCommodity == null, ErrorCode.NOT_FOUND_ERROR);
        // 操作数据库
        boolean result = commodityService.updateById(commodity);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        return ResultUtils.success(true);
    }

    /**
     * 根据 id 获取商品表（封装类）
     *
     * @param id
     * @return
     */
    @GetMapping("/get/vo")
    public BaseResponse<CommodityVO> getCommodityVOById(long id, HttpServletRequest request) {
        ThrowUtils.throwIf(id <= 0, ErrorCode.PARAMS_ERROR);
        // 查询数据库
        Commodity commodity = commodityService.getById(id);
        ThrowUtils.throwIf(commodity == null, ErrorCode.NOT_FOUND_ERROR);
        // 获取封装类
        return ResultUtils.success(commodityService.getCommodityVO(commodity, request));
    }

    /**
     * 分页获取商品表列表（仅管理员可用）
     *
     * @param commodityQueryRequest
     * @return
     */
    @PostMapping("/list/page")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Page<Commodity>> listCommodityByPage(@RequestBody CommodityQueryRequest commodityQueryRequest) {
        long current = commodityQueryRequest.getCurrent();
        long size = commodityQueryRequest.getPageSize();
        // 查询数据库
        Page<Commodity> commodityPage = commodityService.page(new Page<>(current, size),
                commodityService.getQueryWrapper(commodityQueryRequest));
        return ResultUtils.success(commodityPage);
    }

    /**
     * 分页获取商品表列表（封装类）
     *
     * @param commodityQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/list/page/vo")
    public BaseResponse<Page<CommodityVO>> listCommodityVOByPage(@RequestBody CommodityQueryRequest commodityQueryRequest,
                                                               HttpServletRequest request) {
        long current = commodityQueryRequest.getCurrent();
        long size = commodityQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
        // 查询数据库
        Page<Commodity> commodityPage = commodityService.page(new Page<>(current, size),
                commodityService.getQueryWrapper(commodityQueryRequest));
        // 获取封装类
        return ResultUtils.success(commodityService.getCommodityVOPage(commodityPage, request));
    }

    /**
     * 分页获取当前登录用户创建的商品表列表
     *
     * @param commodityQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/my/list/page/vo")
    public BaseResponse<Page<CommodityVO>> listMyCommodityVOByPage(@RequestBody CommodityQueryRequest commodityQueryRequest,
                                                                 HttpServletRequest request) {
        ThrowUtils.throwIf(commodityQueryRequest == null, ErrorCode.PARAMS_ERROR);
        // 补充查询条件，只查询当前登录用户的数据
        User loginUser = userService.getLoginUser(request);
        commodityQueryRequest.setAdminId(loginUser.getId());
        long current = commodityQueryRequest.getCurrent();
        long size = commodityQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
        // 查询数据库
        Page<Commodity> commodityPage = commodityService.page(new Page<>(current, size),
                commodityService.getQueryWrapper(commodityQueryRequest));
        // 获取封装类
        return ResultUtils.success(commodityService.getCommodityVOPage(commodityPage, request));
    }

    /**
     * 编辑商品表（给用户使用）
     *
     * @param commodityEditRequest
     * @param request
     * @return
     */
    @PostMapping("/edit")
    public BaseResponse<Boolean> editCommodity(@RequestBody CommodityEditRequest commodityEditRequest, HttpServletRequest request) {
        if (commodityEditRequest == null || commodityEditRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        // todo 在此处将实体类和 DTO 进行转换
        Commodity commodity = new Commodity();
        BeanUtils.copyProperties(commodityEditRequest, commodity);
        // 数据校验
        commodityService.validCommodity(commodity, false);
        User loginUser = userService.getLoginUser(request);
        // 判断是否存在
        long id = commodityEditRequest.getId();
        Commodity oldCommodity = commodityService.getById(id);
        ThrowUtils.throwIf(oldCommodity == null, ErrorCode.NOT_FOUND_ERROR);
        // 判断是否需要跳过权限检查(更新浏览量或者收藏量，无需权限检查）
        boolean isSkipPermissionCheck = (commodityEditRequest.getFavourNum() != null && commodityEditRequest.getFavourNum() >= 0)
                || (commodityEditRequest.getViewNum() != null && commodityEditRequest.getViewNum() >= 0);

// 如果不需要跳过权限检查，则进行权限验证
        if (!isSkipPermissionCheck) {
            // 仅管理员可编辑
            if (!userService.isAdmin(loginUser)) {
                throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
            }
        }

        // 操作数据库
        boolean result = commodityService.updateById(commodity);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        return ResultUtils.success(true);
    }
    // 购买接口（根据余额情况自动支付或创建未支付订单）
    @PostMapping("/buy")
    public synchronized BaseResponse<Map<String, Object>> buyCommodity(@RequestBody BuyCommodityRequest buyRequest, HttpServletRequest request) {
        // 1. 参数校验
        if (buyRequest == null || buyRequest.getCommodityId() == null || buyRequest.getBuyNumber() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数错误");
        }

        // 2. 获取当前用户
        User loginUser = userService.getLoginUser(request);

        // 3. 查询商品（带锁）
        Commodity commodity = commodityService.getByIdWithLock(buyRequest.getCommodityId());
        if (commodity == null || commodity.getIsDelete() == 1) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "商品不存在");
        }

        // 4. 检查商品状态
        if (commodity.getIsListed() != 1) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "商品未上架");
        }

        // 5. 计算总金额
        BigDecimal totalAmount = commodity.getPrice().multiply(new BigDecimal(buyRequest.getBuyNumber()));

        // 6. 创建基础订单
        CommodityOrder order = new CommodityOrder();
        order.setUserId(loginUser.getId());
        order.setCommodityId(buyRequest.getCommodityId());
        order.setBuyNumber(buyRequest.getBuyNumber());
        order.setPaymentAmount(totalAmount);
        order.setRemark(buyRequest.getRemark());
        // 7. 事务处理
        Map<String, Object> result = transactionTemplate.execute(status -> {
            try {
                // 7.1 获取用户信息（带锁）
                User user = userService.getByIdWithLock(loginUser.getId());

                // 7.2 判断余额是否充足
                boolean balanceEnough = user.getBalance().compareTo(totalAmount) >= 0;

                // 7.3 创建订单记录
                order.setPayStatus(balanceEnough ? 1 : 0);
                if (!commodityOrderService.save(order)) {
                    throw new BusinessException(ErrorCode.OPERATION_ERROR, "订单创建失败");
                }

                // 7.4 如果余额充足则完成支付
                if (balanceEnough) {
                    // 扣减库存
                    commodity.setCommodityInventory(commodity.getCommodityInventory() - buyRequest.getBuyNumber());
                    if (!commodityService.updateById(commodity)) {
                        throw new BusinessException(ErrorCode.OPERATION_ERROR, "库存更新失败");
                    }

                    // 扣减余额
                    user.setBalance(user.getBalance().subtract(totalAmount));
                    if (!userService.updateById(user)) {
                        throw new BusinessException(ErrorCode.OPERATION_ERROR, "余额扣减失败");
                    }
                }

                // 返回结果
                Map<String, Object> resultMap = new HashMap<>();
                resultMap.put("orderId", order.getId());
                resultMap.put("payStatus", order.getPayStatus());
                resultMap.put("needPay", !balanceEnough);
                return resultMap;

            } catch (Exception e) {
                status.setRollbackOnly();
                throw new BusinessException(ErrorCode.OPERATION_ERROR, "购买失败: " + e.getMessage());
            }
        });

        return ResultUtils.success(result);
    }


    // 支付接口（完成支付）
    @PostMapping("/pay")
    public synchronized BaseResponse<Boolean> payCommodityOrder(@RequestBody PayCommodityOrderRequest payRequest, HttpServletRequest request) {
        // 1. 参数校验
        if (payRequest == null || payRequest.getCommodityOrderId() == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数错误");
        }

        // 2. 获取当前用户
        User loginUser = userService.getLoginUser(request);

        // 3. 查询订单（带锁）
        CommodityOrder order = commodityOrderService.getByIdWithLock(payRequest.getCommodityOrderId());
        if (order == null || order.getIsDelete() == 1) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "订单不存在");
        }

        // 4. 验证订单归属
        if (!order.getUserId().equals(loginUser.getId())) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "无权操作此订单");
        }

        // 5. 检查订单状态
        if (order.getPayStatus() != 0) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR,
                    order.getPayStatus() == 1 ? "订单已完成支付" : "订单已过期");
        }

        // 6. todo 检查订单有效期 (后期直接 Redis 查询，有就是没过期，这边用定时任务）

        // 7. 查询商品（带锁）
        Commodity commodity = commodityService.getByIdWithLock(order.getCommodityId());
        if (commodity == null || commodity.getIsDelete() == 1) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "商品不存在");
        }

        // 8. 验证库存
        if (commodity.getCommodityInventory() < order.getBuyNumber()) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "库存不足");
        }

        // 9. 查询用户（带锁）
        User user = userService.getByIdWithLock(loginUser.getId());
        if (user.getBalance().compareTo(order.getPaymentAmount()) < 0) {
            throw new BusinessException(ErrorCode.OPERATION_ERROR, "余额不足");
        }

        // 10. 事务处理
        boolean result = transactionTemplate.execute(status -> {
            try {
                // 10.1 扣减库存
                commodity.setCommodityInventory(commodity.getCommodityInventory() - order.getBuyNumber());
                if (!commodityService.updateById(commodity)) {
                    throw new BusinessException(ErrorCode.OPERATION_ERROR, "库存更新失败");
                }

                // 10.2 扣减余额
                user.setBalance(user.getBalance().subtract(order.getPaymentAmount()));
                if (!userService.updateById(user)) {
                    throw new BusinessException(ErrorCode.OPERATION_ERROR, "余额扣减失败");
                }

                // 10.3 更新订单状态
                order.setPayStatus(1);
                if (!commodityOrderService.updateById(order)) {
                    throw new BusinessException(ErrorCode.OPERATION_ERROR, "订单状态更新失败");
                }

                return true;
            } catch (Exception e) {
                status.setRollbackOnly();
                throw new BusinessException(ErrorCode.OPERATION_ERROR, "支付失败: " + e.getMessage());
            }
        });

        return ResultUtils.success(result);
    }
    /**
     * 基于协同过滤的商品推荐接口
     *
     * @param userId 用户 ID
     * @return 推荐的商品列表
     */
    @GetMapping("/commodityRecommendation")
    public BaseResponse<List<Commodity>> recommendCommodities(@RequestParam Long userId) {

        // 1. 获取用户评分数据
        LambdaQueryWrapper<CommodityScore> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CommodityScore::getUserId,userId);
        List<CommodityScore> userScores = commodityScoreService.list(queryWrapper);

        // 2. 获取所有商品的评分数据
        List<CommodityScore> allScores = commodityScoreService.list();

        // 3. 构建用户-商品评分矩阵
        Map<Long, Map<Long, Integer>> userCommodityRatingMap = new HashMap<>();
        for (CommodityScore score : allScores) {
            userCommodityRatingMap
                    .computeIfAbsent(score.getUserId(), k -> new HashMap<>())
                    .put(score.getCommodityId(), score.getScore());
        }

        // 4. 计算商品相似度
        Map<Long, Double> commoditySimilarityMap = calculateCommoditySimilarity(userScores, userCommodityRatingMap);

        // 5. 推荐商品
        List<Long> recommendedCommodityIds = recommendCommodities(userScores, commoditySimilarityMap);
        if(recommendedCommodityIds.isEmpty()){
            return ResultUtils.error(ErrorCode.PARAMS_ERROR,"您还未购买或完成评分商品的行为，暂时无法推荐");
        }
        // 6. 查询推荐商品的详细信息
        return ResultUtils.success(commodityService.listByIds(recommendedCommodityIds));
    }

    /**
     * 计算商品相似度（基于余弦相似度）
     *
     * @param userScores              用户评分数据
     * @param userCommodityRatingMap 用户-商品评分矩阵
     * @return 商品相似度映射表
     */
    private Map<Long, Double> calculateCommoditySimilarity(List<CommodityScore> userScores, Map<Long, Map<Long, Integer>> userCommodityRatingMap) {
        Map<Long, Double> similarityMap = new HashMap<>();

        // 获取用户评分过的商品 ID
        Set<Long> ratedCommodityIds = userScores.stream()
                .map(CommodityScore::getCommodityId)
                .collect(Collectors.toSet());

        // 计算每个商品与用户评分过的商品的相似度
        for (Long commodityId : ratedCommodityIds) {
            double similarity = calculateCosineSimilarity(commodityId, userScores, userCommodityRatingMap);
            similarityMap.put(commodityId, similarity);
        }

        return similarityMap;
    }

    /**
     * 计算余弦相似度
     *
     * @param commodityId             商品 ID
     * @param userScores              用户评分数据
     * @param userCommodityRatingMap 用户-商品评分矩阵
     * @return 相似度值
     */
    private double calculateCosineSimilarity(Long commodityId, List<CommodityScore> userScores, Map<Long, Map<Long, Integer>> userCommodityRatingMap) {
        // 1. 获取目标商品的评分向量
        Map<Long, Integer> targetCommodityRatings = new HashMap<>();
        for (CommodityScore score : userScores) {
            if (score.getCommodityId().equals(commodityId)) {
                targetCommodityRatings.put(score.getUserId(), score.getScore());
            }
        }

        // 2. 遍历所有商品，计算与目标商品的相似度
        double dotProduct = 0.0; // 点积
        double targetNorm = 0.0; // 目标商品的向量模
        double otherNorm = 0.0;  // 其他商品的向量模

        for (Map.Entry<Long, Map<Long, Integer>> entry : userCommodityRatingMap.entrySet()) {
            Long userId = entry.getKey();
            Map<Long, Integer> ratings = entry.getValue();

            // 获取目标商品和当前商品的评分
            Integer targetRating = targetCommodityRatings.get(userId);
            Integer otherRating = ratings.get(commodityId);

            if (targetRating != null && otherRating != null) {
                dotProduct += targetRating * otherRating; // 累加点积
                targetNorm += Math.pow(targetRating, 2);  // 累加目标商品向量的平方
                otherNorm += Math.pow(otherRating, 2);   // 累加其他商品向量的平方
            }
        }

        // 3. 计算余弦相似度
        if (targetNorm == 0 || otherNorm == 0) {
            return 0.0; // 避免除零错误
        }
        return dotProduct / (Math.sqrt(targetNorm) * Math.sqrt(otherNorm));
    }

    /**
     * 推荐商品
     *
     * @param userScores          用户评分数据
     * @param commoditySimilarityMap 商品相似度映射表
     * @return 推荐的商品 ID 列表
     */
    private List<Long> recommendCommodities(List<CommodityScore> userScores, Map<Long, Double> commoditySimilarityMap) {
        // 根据相似度排序，推荐相似度高的商品
        return commoditySimilarityMap.entrySet().stream()
                .sorted((e1, e2) -> Double.compare(e2.getValue(), e1.getValue())) // 按相似度降序排序
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }
    // endregion
}
