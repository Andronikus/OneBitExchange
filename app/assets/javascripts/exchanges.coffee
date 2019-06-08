getNewExchange = false

$(document).ready ->
    getNewExchange = true
    # click event to change the currency to exchange
    $('#btnSwitch').click (event) -> 
        event.preventDefault()
        sourceCurrencyTemp = $("#source_currency").val()
        targetCurrencyTemp = $("#target_currency").val()
        $("#source_currency").val(targetCurrencyTemp)
        $("#target_currency").val(sourceCurrencyTemp)
        getNewExchange = true
        queryValue()
        return
    $('#amount').keyup (event) ->
        queryValue()
        return

    $('#amount').focusout () -> 
        getNewExchange = true
        return

    $('#source_currency').change () -> 
        getNewExchange = true
        queryValue()
        return

    $('#target_currency').change () -> 
        getNewExchange = true
        queryValue()
        return
    
    queryValue()
    return false

queryValue = ->
         $.ajax '/convert',
             type: 'GET'
             dataType: 'json'
             data: {
                 source_currency: $("#source_currency").val(),
                 target_currency: $("#target_currency").val(),
                 amount: $("#amount").val(),
                 isToGetNewExchange: getNewExchange
             }
             error: (jqXHR, textStatus, errorThrown) -> 
                 alert textStatus
             success: (data, text, jqXHR) -> 
                 $('#result').val(data.value)
         getNewExchange = false
         return false