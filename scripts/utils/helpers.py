def check_empty(name):
    if not name:
        return False
    else:
        count = 0
        for i in name:
            if i == " ":
                count += 1
        if len(name) == count:
            return False
    return True

def sanitize_year(year):
    if not year:
        return None
    else:
        return int(year)

def sanitize_coverage(coverage):
    tmp = coverage.split(",")
    for i in range(len(tmp)):
        tmp[i] = int(tmp[i])
        if tmp[i] <= 0 or tmp[i] >= 4:
            return None
    return tmp