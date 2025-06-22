package com.xiaobaitiao.springbootinit.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaobaitiao.springbootinit.model.dto.barrage.BarrageQueryRequest;
import com.xiaobaitiao.springbootinit.model.entity.Barrage;
import com.xiaobaitiao.springbootinit.model.vo.BarrageVO;

import javax.servlet.http.HttpServletRequest;

public interface BarrageService extends IService<Barrage> {

    /**
     * 校验数据
     *
     * @param barrage
     * @param add 对创建的数据进行校验
     */
    void validBarrage(Barrage barrage, boolean add);

    /**
     * 获取查询条件
     *
     * @param barrageQueryRequest
     * @return
     */
    QueryWrapper<Barrage> getQueryWrapper(BarrageQueryRequest barrageQueryRequest);
    
    /**
     * 获取弹幕封装
     *
     * @param barrage
     * @param request
     * @return
     */
    BarrageVO getBarrageVO(Barrage barrage, HttpServletRequest request);

    /**
     * 分页获取弹幕封装
     *
     * @param barragePage
     * @param request
     * @return
     */
    Page<BarrageVO> getBarrageVOPage(Page<Barrage> barragePage, HttpServletRequest request);
}
