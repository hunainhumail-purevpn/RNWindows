import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  ActivityIndicator,
  FlatList,
  TouchableOpacity,
  StyleSheet,
  AppRegistry,
  DeviceEventEmitter,
  NativeModules,
  // NativeEventEmitter,
  NativeAppEventEmitter,
  Platform
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import axios from 'axios';
// import MyEventEmitter from './myEventEmitter';


const Countries = () => {
  const MyNativeModule = NativeModules.MyNativeModule;
  // NativeAppEventEmitter.removeAllListeners("myJavscriptFunction");
  // NativeAppEventEmitter.addListener("myJavscriptFunction", body => {

  //   console.log("INSIDE FUNC: ", body)
  //   NativeModules.MyEventEmitter.onEvent('ONNNNNN')
  // })



  // const MyEventEmitter = NativeModules.MyEventEmitter;

  const [storedCountries, setStoredCountries] = useState([]);
  const [countries, setCountries] = useState([])
  const [isLoading, setIsLoading] = useState(false)

  DeviceEventEmitter.removeAllListeners("myJavscriptFunction");

  DeviceEventEmitter.addListener('myJavscriptFunction', async () => {

    console.log('I AM INSIDE EVENT EMITTER')

    const dataArray = countries.map((item) => {
      return {
        name: item.name,
        iso_code: item.iso_code,
      };
    });

    const array = [];
    dataArray.forEach((item) => {
      const map = new Map();
      map.set('name', item.name);
      map.set('iso_code', item.iso_code);
      array.push(map);
    });

    const writableArray = [];
    array.forEach((item) => {
      const writableMap = {};
      writableMap.name = item.get('name');
      writableMap.iso_code = item.get('iso_code');
      writableArray.push(writableMap);
    });

    console.log(writableArray)

    Platform.OS === 'android' ? MyNativeModule.receiveData(writableArray) : NativeModules.MyEventEmitter.receiveData(writableArray);

  })

  useEffect(() => {
    const fetchCountries = async (onlyFetch) => {

      let countries = await axios.get("https://bpc-prod-a230.s3.serverwild.com/bpc/res_5d4565b42f2c5/inventory/shared/android/v3/app.json")
      onlyFetch && console.log('COUNTRIES FIRST TIME FETCH: ', countries)
      let formattedData = []
      countries.data.body.countries.map(i => {
        let payload
        payload = { name: i.name, iso_code: i.country }
        formattedData.push(payload)
      })

      setCountries(formattedData)

      await AsyncStorage.setItem("countries", JSON.stringify(formattedData))
    }
    const getCountriesData = async () => {
      const data = await AsyncStorage.getItem("countries")
      data ? setStoredCountries(JSON.parse(data)) : fetchCountries()
      if (data) {
        fetchCountries()
        setStoredCountries(JSON.parse(data))
      }
      else {
        setIsLoading(true)
        fetchCountries({ onlyFetch: true })
        setIsLoading(false)

      }

    }
    getCountriesData()

  }, []);


  const renderItem = ({ item, index }) => {
    return (
      <TouchableOpacity style={style.shadowBox}>
        <Text style={{color: 'black'}}>{item.name}</Text>
      </TouchableOpacity>
    );
  };

  return (
    <View style={{ backgroundColor: 'red' }}>
      {isLoading ? (
        <ActivityIndicator size={'small'} color={"#373737"} />
      ) : (
        <FlatList
          key={(item, index) => index}
          renderItem={renderItem}
          data={countries ? countries : storedCountries}
        />
      )}
    </View>
  );
};

export default Countries;

AppRegistry.registerComponent('ReactPOC', () => Countries)

const style = StyleSheet.create({

  shadowBox: {
    marginTop: 30,
    height: 100,
    width: '90%',
    backgroundColor: 'white',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.4,
    shadowRadius: 3,
    elevation: 5,
    alignSelf: 'center',
    justifyContent: 'center',
    alignItems: 'center'
  },
});
