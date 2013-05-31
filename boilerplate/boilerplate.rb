
# def saveContext
#   error_ptr = Pointer.new(:object)
#   managedObjectContext = self.managedObjectContext
#   if managedObjectContext
#     if managedObjectContext.hasChanges && !managedObjectContext.save(error_ptr)
#       # Replace this implementation with code to handle the error appropriately.
#       # abort() causes the application to generate a crash log and terminate. You should not use this function in a 
#       # shipping application, although it may be useful during development. 
#       NSLog("Unresolved error %@, %@", error_ptr, error_ptr.userInfo)
#       abort
#     end
#   end
# end
# 
# #pragma mark - Core Data stack
# 
# # Returns the managed object context for the application.
# # If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
# def managedObjectContext
#   return _managedObjectContextif _managedObjectContext != nil
# 
#   coordinator = self.persistentStoreCoordinator
#   if coordinator
#     _managedObjectContext = NSManagedObjectContext.alloc.init
#     _managedObjectContext.setPersistentStoreCoordinator:coordinator
#   end
#   _managedObjectContext
# end
# 
# # Returns the managed object model for the application.
# # If the model doesn't already exist, it is created from the application's model.
# def managedObjectModel
#     return _managedObjectModel if _managedObjectModel
# 
#     modelURL = NSBundle.mainBundle.URLForResource "abc", withExtension:"momd"
#     _managedObjectModel = NSManagedObjectModel.alloc.initWithContentsOfURL modelURL
#     return _managedObjectModel
# end
# 
# # Returns the persistent store coordinator for the application.
# # If the coordinator doesn't already exist, it is created and the application's store added to it.
# def persistentStoreCoordinator
#     if _persistentStoreCoordinator.nil?
#       return _persistentStoreCoordinator
#     end
# 
#     storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent "abc.sqlite"
# 
#     error_ptr = Pointer.new(:object)
#     _persistentStoreCoordinator = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel self.managedObjectModel
#     unless _persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:storeURL, error:error_ptr)
#       NSLog("Unresolved error %@, %@", error_ptr, error_ptr.userInfo)
#       abort
#     end
# 
#     return _persistentStoreCoordinator
# end
# 
# def applicationDocumentsDirectory
#   NSFileManager.defaultManager.URLsForDirectory(NSDocumentDirectory, inDomains:NSUserDomainMask).lastObject
# end
