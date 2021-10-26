/**
 * 数组操作方法
 * @type {{setTop: (function(*, *): *), swapItems: (function(*, *, *=): *), setBottom: (function(*, *=): *), insert: (function(*, *=, *=): *), moveDown: (function(*=, *=): *), delete: (function(*, *=): *), moveUp: (function(*=, *=): *)}}
 */
export const ArrayUtil = {
    swapItems: (arr, index1, index2) => {
        arr[index1] = arr.splice(index2, 1, arr[index1])[0];
        return arr;
    },
    // 上移
    moveUp: (arr, $index) => {
        if($index == 0) {
            return;
        }
        return ArrayUtil.swapItems(arr, $index, $index - 1);
    },
    // 下移
    moveDown: (arr, $index) => {
        if($index == arr.length -1) {
            return;
        }
        return ArrayUtil.swapItems(arr, $index, $index + 1);
    },
    // 插入
    insert: (arr, $index, obj) => {
        arr.splice($index, 0, obj);
        return arr;
    },
    // 插入到下一个
    insertNext: (arr, $index, obj) => {
        arr.splice($index + 1, 0, obj);
        return arr;
    },
    //删除
    delete: (arr, $index) => {
        arr.splice($index, 1);
        return arr;
    },
    // 置顶
    setTop: (arr, $index) => {
        arr.unshift(arr[$index]);
        arr.splice($index + 1, 1);
        return arr;
    },
    // 置底
    setBottom: (arr, $index) => {
        arr.push(arr[$index]);
        arr.splice($index, 1);
        return arr;
    },

};