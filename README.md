# Getx-Study
Getx Study

#### 状态管理

- Obx          (修改數據不用setState())
- GetX         (局部刷新)
- GetBuilder   (手動控制局部刷新)
- ValueBuilder 

#### 防抖、限流 函数

pages/state_workers

監聽某值的變化

- ever 每次
- once 第一次
- debounce 防抖 2 秒内 (搜索框 監聽用戶輸入效果OK)
- interval 定时器 1 秒

#### 依賴注入

- Get.put
- Get.lazyPut

#### 視圖

- GetView

##### Obs

``` 
final count = 0.obs;  // 初始化

child: Column(
  children: [
    Obx(() => Text("count1 -> " + count.toString())),  // 涉及到Obs的數據展示都需要包裝一曾
    Obx(() => Text("count2 -> " + count.toString())),

    Divider(),
    ElevatedButton(
      onPressed: () {
        count.value++;   // 操作obs
      },
      child: Text('add'),
    ),
  ],
),
```


#### GetX

适合控制多控制器、多状态更新，可精细控制初始、局部渲染。

1. 構建 CountController
``` 
class CountController extends GetxController {
  final _count = 0.obs;
  set count(value) => _count.value = value;
  get count => _count.value;

  final _count2 = 0.obs;
  set count2(value) => _count2.value = value;
  get count2 => _count2.value;

  add() => _count.value++;
  add2() => _count2.value++;
}
```

2. 使用

獲取和設置都需要放在GetX中執行

``` 
GetX<CountController>(
  init: controller,
  initState: (_) {},
  builder: (_) {
    print("GetX - 1");
    return Text('value 1 -> ${_.count}');
  },
)
```