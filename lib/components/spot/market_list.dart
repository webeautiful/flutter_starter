import 'package:flutter/material.dart';
import 'package:flutter_starter/models/spot_market_entity.dart';
import 'package:flutter_starter/styles/app_colors.dart';
import 'package:flutter_starter/utils/format.dart';
import 'package:flutter_starter/utils/utils.dart';

class MarketList extends StatelessWidget {
  final List<SpotMarketItem> list;
  const MarketList({super.key, required this.list});

  Widget _buildHeader() {
    const style = TextStyle(
      fontSize: 12,
      height: 1.5,
      color: AppColors.secondaryText,
    );
    return const Row(
      children: [
        Expanded(
          child: Text('币种', style: style),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('最新价(USDT)', style: style),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('24h涨跌幅', style: style),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(int index) {
    const style1 = TextStyle(
      fontSize: 14,
      height: 1.4,
      color: AppColors.primaryText,
    );
    const style2 = TextStyle(
      fontSize: 12,
      height: 1.4,
      color: AppColors.secondaryText,
    );
    const style3 = TextStyle(
      fontSize: 14,
      height: 1.2,
      color: Colors.white,
    );
    SpotMarketItem item = list[index];
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(
                  toStr(item.icon),
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(toStr(item.market), style: style1),
                      ),
                      const FittedBox(
                        child: Text('成交额 17.53K', style: style2),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(str2num(item.tickerData?.last).toString(),
                  style: style1),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: MaterialStatePropertyAll(AppColors.green),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                child: Text('5%', style: style3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => _buildItem(index),
            ),
          ),
        ],
      ),
    );
  }
}
