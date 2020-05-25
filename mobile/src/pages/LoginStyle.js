import {StyleSheet} from 'react-native';
//import Constants from 'expo-constants';

export default StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 4,
//    paddingTop: Constants.statusBarHeight,
  },
  header: {
    fontSize: 42,
    paddingTop: 64,
    textAlign: 'center',
    color: '#7532a8',
    fontWeight: 'bold',
  },
  enterbox: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 128,
    marginLeft: 64,
    marginRight: 64,
    padding: 16,
    backgroundColor: '#7532a8',
    borderRadius: 8,
  },
  defaulttext: {
    color: '#ffffff',
    fontSize: 32,
    marginRight: 16,
  },
});
