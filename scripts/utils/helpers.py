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