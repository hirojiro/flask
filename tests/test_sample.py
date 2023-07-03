import pytest

def test_func():
    assert 1 == 1

def test_func2():
    assert 2 == 2

def test_func3(app_data):
    assert app_data == 3