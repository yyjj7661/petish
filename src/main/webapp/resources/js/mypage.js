   function openMap(modifyForm) {
      var url = "mapDetail.jsp";
      //새로운 창을 url+option에 맞게 띄워줌.
      open(url, "confirm", "toolbar=no,location=no,"
            + "status=no,menubar=no," + "scrollbars=yes,resizable=no,"
            + "width=650,height=550");
   }