extension ListExtension on List {
  void addAllUniqueFromAnotherList(List list, List otherList) {
    for(int i = 0 ; i < list.length ; i++){
      if(!otherList.contains(list[i])){
        add(list[i]);
      }
    }
  }
}