from furl import furl


def main():
    f = furl('http://www.baidu.com')
    print f.url
    print('The rain in Spain falls mainly in the plain.')


if __name__ == '__main__':
    main()
