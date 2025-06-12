//Bubble sort is actually a little more complicated and involves swapping numbers and for there
//  to be an existing incremental list
//Bubble Sort
//1,2,3,4 (original order)
//1,2,3,4 -> swap (3 becomes 4 & 4 becomes 3) -> two updates, get current index & count of all
//
//IncreaseOrderIdTranslationA
//DecreaseOrderIdTranslationA
//
//increase order
//  in reducer
//    translations = where translationLang == "EN" && fromId = wordId order by OrderId
//    translationNext = get Translation where id == 2 && get next
//    translationPrevious = get Translation where id == 2 && get next
//    swapTranslation = translations.where(id == translationId).next
//    if(translationNext == null)
//      var new1 = translation.cw(orderId: translationAfter.orderId +1)
//
//    else
//      var new1 = translation.cw(orderId: translationNext.orderId)
//      var new2 = translationNext.cw(orderId: translation.orderId)
//    else
