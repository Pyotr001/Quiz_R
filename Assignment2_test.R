makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) { 
                x <<- y
                m <<- NULL # очищаем кеш при новой записи
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, 
             get = get, # Создаем список из функций обращаемся
             setmean = setmean,
             getmean = getmean)
}
# Создаем список с функциями, куда можно сразу передать вектор исходных значений
# x <- makeVector(c(1, 2, 3, 45, 7))
# x$get() выдает исходный вектор
# x$setmean("...") кеширует то, что передаём
# x$getmean() отдает кеш


# cachemean(x) сосчитает среднее и покажет его и запишет в кэш
# при наличии в кеше - вдаеет предупреждающую строку
cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

 