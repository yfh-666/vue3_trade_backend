package com.xiaobaitiao.springbootinit.utils;

import com.xiaobaitiao.springbootinit.model.entity.Commodity;
import com.xiaobaitiao.springbootinit.model.entity.User;

import java.util.List;
import java.util.stream.Collectors;

public class PromptSelector {

    public static String buildPrompt(IntentClassifier.Intent intent, String userInput, List<Commodity> commodities, User user) {
        switch (intent) {
            case PRODUCT_RECOMMENDATION:
                String commodityList = commodities.stream()
                        .filter(c -> c.getIsListed() == 1)
                        .map(c -> String.format("商品名称: %s, 新旧程度: %s, 库存: %d, 价格: %.2f",
                                c.getCommodityName(),
                                c.getDegree(),
                                c.getCommodityInventory(),
                                c.getPrice()
                        ))
                        .collect(Collectors.joining("\\n"));
                return "你是一个智能商品推荐官，以下是数据库中正在出售的商品信息：\\n"
                        + commodityList + "\\n"
                        + "你只能从上述商品中挑选推荐，不能编造。"
                        + "请严格按照用户的输入、商品价格、库存、新旧程度、用户的余额等综合因素，推荐数据库中最适合的商品，并给出推荐理由。\\n"
                        + "用户余额：" + user.getBalance() + "\\n"
                        + "用户输入：" + userInput;


            case CUSTOMER_SERVICE:
                return "用户请求客服服务，请生成一段友好、专业的回复：\\n用户输入：" + userInput;

            case ORDER_CANCEL:
                return "用户表达了取消订单的意图，请给予适当回应或引导：\\n用户输入：" + userInput;

            case CASUAL_CHAT:
                return "用户正在进行闲聊，请自然地风趣地与其对话：\\n" + userInput;

            case GENERAL_QUESTION:
            default:
                return userInput;
        }
    }
}
